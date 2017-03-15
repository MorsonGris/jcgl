package com.xin.commons.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * 上传文件
 */
public class FileUpload {

	/**上传文件
	 * @param file 			//文件对象
	 * @param filePath		//上传路径
	 * @param fileName		//文件名
	 * @return  文件名
	 */
	public static String fileUp(MultipartFile file, String filePath, String fileName){
		String extName = ""; // 扩展名格式：
		try {
			if (file.getOriginalFilename().lastIndexOf(".") >= 0){
				extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			}
			copyFile(file.getInputStream(), filePath, fileName+extName).replaceAll("-", "");
		} catch (IOException e) {
			System.out.println(e);
		}
		return fileName+extName;
	}
	
	/**
	 * 写文件到当前目录的upload目录中
	 * @param in
	 * @param fileName
	 * @throws IOException
	 */
	private static String copyFile(InputStream in, String dir, String realName)
			throws IOException {
		File file = mkdirsmy(dir,realName);
		FileUtils.copyInputStreamToFile(in, file);
		return realName;
	}
	
	
	/**判断路径是否存在，否：创建此路径
	 * @param dir  文件路径
	 * @param realName  文件名
	 * @throws IOException 
	 */
	public static File mkdirsmy(String dir, String realName) throws IOException{
		File file = new File(dir, realName);
		if (!file.exists()) {
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			file.createNewFile();
		}
		return file;
	}
	
	
	/**下载网络图片上传到服务器上
	 * @param httpUrl 图片网络地址
	 * @param filePath	图片保存路径
	 * @param myFileName  图片文件名(null时用网络图片原名)
	 * @return	返回图片名称
	 */
	public static String getHtmlPicture(String httpUrl, String filePath , String myFileName) {
		
		URL url;						//定义URL对象url
		BufferedInputStream in;			//定义输入字节缓冲流对象in
		FileOutputStream file;			//定义文件输出流对象file
		try {
			String fileName = null == myFileName?httpUrl.substring(httpUrl.lastIndexOf("/")).replace("/", ""):myFileName; //图片文件名(null时用网络图片原名)
			url = new URL(httpUrl);		//初始化url对象
			in = new BufferedInputStream(url.openStream());									//初始化in对象，也就是获得url字节流
			//file = new FileOutputStream(new File(filePath +"\\"+ fileName));
			file = new FileOutputStream(mkdirsmy(filePath,fileName));
			int t;
			while ((t = in.read()) != -1) {
				file.write(t);
			}
			file.close();
			in.close();
			return fileName;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	/**
	 * 图片上传
	 * @param request
	 * @param response
	 * @param filename
	 * @param filePath
	 * @throws IllegalStateException
	 * @throws IOException
	 * */
	public static void pictureUpload(HttpServletRequest request,HttpServletResponse response,String filename,String filePath) throws IllegalStateException, IOException {
		//创建一个通用的多部分解析器  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
        //判断 request 是否有文件上传,即多部分请求  
        if(multipartResolver.isMultipart(request)){  
            //转换成多部分request    
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;  
            //取得request中的所有文件名  
            Iterator<String> iter = multiRequest.getFileNames();
            while(iter.hasNext()){  
                //记录上传过程起始时的时间，用来计算上传时间  
                int pre = (int) System.currentTimeMillis();  
                //取得上传文件  
                MultipartFile file = multiRequest.getFile(iter.next());  
                if(file != null){  
                    //取得当前上传文件的文件名称
                    String myFileName = file.getOriginalFilename();  
                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
                    if(myFileName.trim() !=""){  
                        System.out.println(myFileName);  
                        //重命名上传后的文件名  
                        String fileName = filename + file.getOriginalFilename();  
                        //定义上传路径  
                        String path = filePath + fileName;  
                        File localFile = new File(path);  
                        file.transferTo(localFile);
                    }  
                }  
                //记录上传该文件后的时间  
                int finaltime = (int) System.currentTimeMillis();  
                System.out.println(finaltime - pre);
            }
        }
	}
}
