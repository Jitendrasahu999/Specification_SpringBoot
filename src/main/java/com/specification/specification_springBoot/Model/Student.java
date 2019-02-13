package com.specification.specification_springBoot.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.*;

@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "student_data_with_projection")
public class Student {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "age")
    private String age;

    @Column(name = "salary")
    private Float salary;

    @Column(name = "address")
    private String address;
}
