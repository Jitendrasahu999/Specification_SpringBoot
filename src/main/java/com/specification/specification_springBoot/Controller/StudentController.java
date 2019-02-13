package com.specification.specification_springBoot.Controller;

import com.specification.specification_springBoot.Model.Student;
import com.specification.specification_springBoot.Repository.StudentRepository;
import com.specification.specification_springBoot.Specification.StudentSpecification;
import com.specification.specification_springBoot.Utils.SearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "api/student/") //This is a Base URL in Our Controller.
public class StudentController {

    @Autowired
    StudentRepository studentRepository;

    @GetMapping(path = "all")
    public @ResponseBody
    Iterable<Student> getAllStudentWIthProjection(@RequestParam(required = false, defaultValue = "") String name_like,
                                                  @RequestParam(required = false, defaultValue = "") String age_like,
                                                  @RequestParam(required = false) Float salary_like,
                                                  @RequestParam(required = false, defaultValue = "") String address_like,
                                                  @RequestParam(required = false, defaultValue = "0") int pageNum,
                                                  @RequestParam(required = false, defaultValue = "20") int pageSize) {

        StudentSpecification spec1 =
                new StudentSpecification(new SearchCriteria("name", ":", name_like));

        StudentSpecification spec2 =
                new StudentSpecification(new SearchCriteria("age", ":", age_like));

        StudentSpecification spec3 =
                new StudentSpecification(new SearchCriteria("address", ":", address_like));

        Specification<Student> specGroup = Specification.where(spec1).and(spec2).and(spec3);

        if (salary_like != null) {
            StudentSpecification spec4 =
                    new StudentSpecification(new SearchCriteria("salary", ":", salary_like));
            specGroup = specGroup.and(spec4);
        }

        return studentRepository.findAll(specGroup, PageRequest.of(pageNum, pageSize));

    }
}
