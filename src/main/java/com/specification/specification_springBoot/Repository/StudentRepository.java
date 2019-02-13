package com.specification.specification_springBoot.Repository;

import com.specification.specification_springBoot.Model.Student;
import com.specification.specification_springBoot.StudentProjection.StudentListItem;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import th.co.geniustree.springdata.jpa.repository.JpaSpecificationExecutorWithProjection;

//@RepositoryRestResource(excerptProjection = StudentListItem.class)
public interface StudentRepository extends PagingAndSortingRepository<Student, Long>, JpaSpecificationExecutor<Student> {
}
