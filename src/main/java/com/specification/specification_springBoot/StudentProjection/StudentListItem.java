package com.specification.specification_springBoot.StudentProjection;

import com.specification.specification_springBoot.Model.Student;
import org.springframework.data.rest.core.config.Projection;

@Projection(
        name = "studentListItems",
        types = { Student.class })
public interface StudentListItem {
    Long getId();
    String getName();
    String getAge();
    Float getSalary();
    String getAddress();
}
