package com.momo.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.FileDto;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class FileDao extends DBConnPool{

	/**
	 * 파일 등록
	 * @param fileDto
	 * @return
	 */
	public int regFile(FileDto fileDto) {
		
		System.out.println(fileDto.getFile_no());
		System.out.println(fileDto.getName());
		System.out.println(fileDto.getCate());
		System.out.println(fileDto.getOfile());
		System.out.println(fileDto.getSfile());
		
		String sql = "insert into tbl_file (  file_no, name, title, cate, ofile, sfile)\r\n"
					+ "	values ( seq_tbl_file.nextval, ?, ?, ?, ?, ?)";
		int res = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fileDto.getName());
			pstmt.setString(2, fileDto.getTitle());
			pstmt.setString(3, fileDto.getCate());
			pstmt.setString(4, fileDto.getOfile());
			pstmt.setString(5, fileDto.getSfile());
			
			res = pstmt.executeUpdate();
			
			System.out.println(res + "건의 파일이 등록되었습니다.");
			
			return res;
			
		} catch (SQLException e) {
			System.out.println("FileDao.regFile()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 파일 리스트 출력
	 */
	public List<FileDto> getList() {
		List<FileDto> list = new ArrayList<>();
		String sql = "select * from tbl_file order by file_no desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			// 결과집합
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FileDto dto = new FileDto();
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setFile_no(rs.getInt("file_no"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("FileDao.getList()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		
		return list;
	}
	
	//파일 업로드
	public static String uploadFile(HttpServletRequest request, String sDirectory) throws ServletException, IOException {
		//Part 객체를 통해 서버로 전송된 파일명 읽어오기 
		Part part = request.getPart("attachedFile");					
		 
		//Part 객체의 헤더값 중 content-disposition 읽어오기 
        String partHeader = part.getHeader("content-disposition");
        //출력결과 => form-data; name="attachedFile"; filename="파일명.jpg"
        System.out.println("uploadFile()_partHeader : "+ partHeader);
         
        //헤더값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
        String fileName = phArr[1].trim().replace("\"", "");
			
		//전송된 파일이 있다면 디렉토리에 저장
		if (!fileName.isEmpty()) {				
			part.write(sDirectory+ File.separator +fileName);
		}
			 
		//원본 파일명 반환
		return fileName;			
	}
	
	
	/* 파일이 첨부된경우 파일명이 중복되어 파일이 유실되는 경우를 방지하기 위해 파일명을 변경 합니다.
	 * 	- 중복된 파일을 업로드 하는 경우 기존에 저장된 파일이 소실될 우려가 있으므로 파일명을 변경하여 저장 합니다.
	 * 	- 파일을 저장 할때는 /년/월/일 폴더를 생성후 파일명에 날자를 붙여서 저장 
	 * 	- 파일을 저장 할때 파일명_날자시간.확장자
	 * 	- 파일을 저장 할때 날자시간_파일명.확장자
	 */
	//파일명 변경
	public static String renameFile(String sDirectory, String fileName) {
		//원본파일의 확장자 잘라내기
		String ext = fileName.substring(fileName.lastIndexOf("."));
		//날짜 및 시간을 통해 파일명 생성
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		//"원본파일명_날짜_시간.확장자" 형태의 새로운 파일명 생성
		//원본파일명
		String oFileName = fileName.substring(0, fileName.lastIndexOf("."));
		String newFileName = oFileName+ "_" + now + ext;  
		System.out.println("renameFile()_newFileName : " + newFileName);

		//기존 파일명을 새로운 파일명으로 변경
		File oldFile = new File(sDirectory + File.separator + fileName);
	    File newFile = new File(sDirectory + File.separator + newFileName);
	    oldFile.renameTo(newFile);
	    
	    //변경된 파일명 반환
	    return newFileName;
	}	

		
	//multiple 속성 추가로 2개 이상의 파일 업로드
	public static ArrayList<String> multipleFile(HttpServletRequest req, String sDirectory)
			throws ServletException, IOException {
		//파일명 저장을 위한 컬렉션 생성
		ArrayList<String> listFileName = new ArrayList<>();
	
		//Part 객체를 통해 서버로 전송된 파일명 읽어오기 
		Collection<Part> parts = req.getParts();
		for(Part part : parts) {
			//파일이 아니라면 업로드의 대상이 아니므로 무시
			if(!part.getName().equals("ofile"))
				continue;	
				
			//Part 객체의 헤더값 중 content-disposition 읽어오기 
	        String partHeader = part.getHeader("content-disposition");
	        //출력결과 => form-data; name="attachedFile"; filename="파일명.jpg"
	        System.out.println("partHeader="+ partHeader);
	        
	        //헤더값에서 파일명 잘라내기
	        String[] phArr = partHeader.split("filename=");
	        String originalFileName = phArr[1].trim().replace("\"", "");
			
			//전송된 파일이 있다면 디렉토리에 저장
			if (!originalFileName.isEmpty()) {				
				part.write(sDirectory+ File.separator +originalFileName);
			}
			
			//컬렉션에 추가
			listFileName.add(originalFileName);
		}
	
		//원본 파일명 반환
		return listFileName;			
	}
	
	//파일 다운로드
	public static void download(HttpServletRequest req, HttpServletResponse resp,
				String directory, String sfileName, String ofileName) {
        
		String sDirectory = req.getServletContext().getRealPath(directory);
        try {
        	// 파일을 찾아 입력 스트림 생성
            File file = new File(sDirectory, sfileName);
            InputStream iStream = new FileInputStream(file);

            // 한글 파일명 깨짐 방지
            String client = req.getHeader("User-Agent");
            if (client.indexOf("WOW64") == -1) {
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            else {
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }
            // 파일 다운로드용 응답 헤더 설정
            resp.reset();
            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition",
                           "attachment; filename=\"" + ofileName + "\"");
            resp.setHeader("Content-Length", "" + file.length() );
	            //out.clear();  // 출력 스트림 초기화

            // response 내장 객체로부터 새로운 출력 스트림 생성
            OutputStream oStream = resp.getOutputStream();

            // 출력 스트림에 파일 내용 출력
            byte b[] = new byte[(int)file.length()];
            int readBuffer = 0;
            while ( (readBuffer = iStream.read(b)) > 0 ) {
                oStream.write(b, 0, readBuffer);
            }

            // 입/출력 스트림 닫음
            iStream.close();
            oStream.close();
        } catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없습니다.");
            e.printStackTrace();
        } catch (Exception e) {
           System.out.println("예외가 발생하였습니다.");
           e.printStackTrace();
        }
	}

    //파일 삭제 
    public static void deleteFile(HttpServletRequest req,
    		String directory, String filename) {
    	String sDirectory = req.getServletContext().getRealPath(directory);
	    File file = new File(sDirectory + File.separator + filename);
        if (file.exists()) {
	            file.delete();
        }
    }
}
