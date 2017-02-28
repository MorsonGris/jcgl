package com.xin.service.impl;

import com.xin.bean.Student;
import com.xin.mapper.StudentMapper;
import com.xin.service.IStudentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService {
	
}
