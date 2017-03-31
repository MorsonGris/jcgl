package com.xin.commons.utils;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;


/**
 * 从EXCEL导入到数据库
 * @version
 */
public class ObjectExcelRead {

	/**
	 * @param filepath //文件路径
	 * @param filename //文件名
	 * @param startrow //开始行号
	 * @param startcol //开始列号
	 * @param sheetnum //sheet
	 * @return list
	 */
	public static List<Object> readExcel(String filepath, String filename, int startrow, int startcol, int sheetnum) {
		List<Object> varList = new ArrayList<Object>();

		try {
			File target = new File(filepath, filename);
			FileInputStream fi = new FileInputStream(target);
			HSSFWorkbook wb = new HSSFWorkbook(fi);
			HSSFSheet sheet = wb.getSheetAt(sheetnum); 					//sheet 从0开始
			int rowNum = sheet.getLastRowNum() + 1; 					//取得最后一行的行号

			for (int i = startrow; i < rowNum; i++) {					//行循环开始
				
				Map<String, Object> varpd = new HashMap<String, Object>();
				HSSFRow row = sheet.getRow(i); 							//行
				int cellNum = row.getLastCellNum(); 					//每行的最后一个单元格位置

				for (int j = startcol; j < cellNum; j++) {				//列循环开始
					
					HSSFCell cell = row.getCell(Short.parseShort(j + ""));
					String cellValue = null;
					if (null != cell) {
						switch (cell.getCellType()) { 					// 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
						case 0:
							if(HSSFDateUtil.isCellDateFormatted(cell)){
								// 如果是date类型则 ，获取该cell的date值     
								cellValue = HSSFDateUtil.getJavaDate(cell.getNumericCellValue()).toString();
							}else {// 纯数字 
								cellValue = String.valueOf((int) cell.getNumericCellValue());
							}
							break;
						case 1:
							cellValue = cell.getStringCellValue();
							break;
						case 2:
							cellValue = cell.getNumericCellValue() + "";
							// cellValue = String.valueOf(cell.getDateCellValue());
							break;
						case 3:
							cellValue = "";
							break;
						case 4:
							cellValue = String.valueOf(cell.getBooleanCellValue());
							break;
						case 5:
							cellValue = String.valueOf(cell.getErrorCellValue());
							break;
						}
					} else {
						cellValue = "";
					}
					
					varpd.put("var"+j, cellValue);
					
				}
				varList.add(varpd);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		
		return varList;
	}
	
	
	/** 
	    * 用来得到真实行数 
	    * @param sheet 
	    * @param flag  需要写进数据库的列数用逗号隔开 比如  (Sheet sheet,int 2,int 3);随意个 
	    * @return 
	    *  
	    */  
	public static int findRealRows(Sheet sheet, int... flag) {  
	       int row_real = 0;  
	       int rows = sheet.getPhysicalNumberOfRows();// 此处物理行数统计有错误,  
	       int size = flag.length;  
	       try {  
	  
	  
	       for (int i = 1; i < rows; i++) {  
	           Row row = sheet.getRow(i);  
	           int total = 0;  
	           ArrayList<Integer> blank =new ArrayList<Integer>();  
	           int type=-1;  
	           String s = null;  
	           for(int j:flag){  
	               if(!(row.getCell(j) == null)&&row.getCell(j).getCellType()<2){  
	                   type=row.getCell(j).getCellType();  
	                   row.getCell(j).setCellType(1);  
	               }  
	  
	               if (row.getCell(j) == null||row.getCell(j).getStringCellValue().matches("^\\s+$")||row.getCell(j).getCellType()>2) {  
	                   total++;  
	  
	                   if(!(row.getCell(j) == null)&&row.getCell(j).getCellType()<2){  
	                   row.getCell(j).setCellType(type);  
	                   }  
	                   blank.add(j);  
	               }  
	           }  
	           System.out.println(s+"我");  
	           // 如果4列都是空说明就该返回  
	           if (total == flag.length) {  
	  
	               return row_real;  
	           } else if (total == 0) {  
	               row_real++;  
	  
	           } else {  
	               String h="";  
	               for(Integer b:blank){  
	  
	                    h=h+"第"+(b+1)+"列"+" ";  
	               }  
	               /*throw new BusinessException("第" + (i + 1) + "行" + h  
	                       + "不能为空");*/  
	           }  
	  
	       }  
	       } catch (NullPointerException e) {  
	           /*throw new BusinessException("excel格式异常,请检查excel格式有无数据缺失,无效数据行!");  */
	    	   e.printStackTrace();
	       }  
	       return row_real;  
	   }  
}
