package com.slxy.edu.util;


import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @program: TeacherWeb
 * @description: 读取excel文件
 * @author: Mr.Jiang
 * @create: 2019-04-27 18:33
 **/

public class ReadExcel {

    //获取excel文件各单元格的值
    public static List getValue(String path) throws ParseException {
        // 需要解析的Excel文件
        File file = new File(path);
        FormulaEvaluator evaluator;
        List list = new ArrayList();
        try {
            // 创建Excel，读取文件内容
            HSSFWorkbook workbook = new HSSFWorkbook(FileUtils.openInputStream(file));
            // 获取第一个工作表workbook.getSheet("Sheet0");
            // 读取默认第一个工作表sheet
            HSSFSheet sheet = workbook.getSheetAt(0);
            int firstRowNum = 2;// 此行开始是数据表的数据
            // 获取sheet中最后一行行号
            int lastRowNum = sheet.getLastRowNum();
            System.out.println("lastRowNum的值是：" + lastRowNum + ".当前方法:ReadExcel.getValue()");
            HSSFRow row = sheet.getRow(1);
            // 获取最后单元格列号
            int lastCellNum = row.getLastCellNum();
            System.out.println("lastCellNum的值是：" + lastCellNum + ".当前方法:ReadExcel.getValue()");
            for (int i = firstRowNum; i <= lastRowNum; i++) {
                row = sheet.getRow(i);
                if (row == null) {
                    // 如果是空行（即没有任何数据、格式），直接把它以下的数据往上移动
                    sheet.shiftRows(i+1, sheet.getLastRowNum(),-1);
                    continue;
                }
                for (int j = 0; j < lastCellNum; j++) {
                    // 获取行
                    HSSFCell cell = row.getCell(j);
                    evaluator = workbook.getCreationHelper().createFormulaEvaluator();
                    // 判断单元格是否为空
                    if (cell != null || "".equals(cell)) {
                        int cellType = cell.getCellType();
                        if (cellType == Cell.CELL_TYPE_FORMULA) { // 表达式类型
                            cellType = evaluator.evaluate(cell).getCellType();
                        }
                        switch (cellType) {
                            case Cell.CELL_TYPE_STRING: // 字符串类型
                                String cellValue = cell.getStringCellValue().trim();
                                cellValue = StringUtils.isEmpty(cellValue) ? "" : cellValue;
                                list.add(cellValue);
                                break;
                            case Cell.CELL_TYPE_BOOLEAN: // 布尔类型
                                cellValue = String.valueOf(cell.getBooleanCellValue());
                                list.add(cellValue);
                                break;
                            case Cell.CELL_TYPE_NUMERIC: // 数值类型
                                if (HSSFDateUtil.isCellDateFormatted(cell)) { // 判断日期类型
                                    Date cellDateValue =  cell.getDateCellValue();
                                    list.add(cellDateValue);
                                } else { // 否
                                    cellValue = new DecimalFormat("#.######").format(cell.getNumericCellValue());
                                    list.add(cellValue);
                                }
                                break;
                            default: // 其它类型，取空串
                                list.add("");
                                break;
                        }
                    }else {
                        list.add("");
                    }
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

}
