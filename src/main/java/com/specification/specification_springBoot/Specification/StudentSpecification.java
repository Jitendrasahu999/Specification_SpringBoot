package com.specification.specification_springBoot.Specification;

import com.specification.specification_springBoot.Model.Student;
import com.specification.specification_springBoot.Utils.SearchCriteria;
import lombok.AllArgsConstructor;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.Date;

@AllArgsConstructor
public class StudentSpecification implements Specification<Student> {

    private SearchCriteria criteria;

    @Override
    public Predicate toPredicate
            (Root<Student> root, CriteriaQuery<?> query, CriteriaBuilder builder) {

        if (criteria.getOperation().equalsIgnoreCase(">")) {
            if (root.get(criteria.getKey()).getJavaType() == Date.class) {
                return builder.greaterThanOrEqualTo(root.<Date>get(criteria.getKey()), (Date)criteria.getValue());
            } else {
                return builder.greaterThanOrEqualTo(
                        root.<String> get(criteria.getKey()), criteria.getValue().toString());
            }
        }
        else if (criteria.getOperation().equalsIgnoreCase("<")) {
            if (root.get(criteria.getKey()).getJavaType() == Date.class) {
                return builder.lessThanOrEqualTo(root.<Date>get(criteria.getKey()), (Date)criteria.getValue());
            } else {
                return builder.lessThanOrEqualTo(
                        root.<String> get(criteria.getKey()), criteria.getValue().toString());
            }
        }
        else if (criteria.getOperation().equalsIgnoreCase(":")) {
            if (root.get(criteria.getKey()).getJavaType() == String.class) {
                return builder.like(
                        root.<String>get(criteria.getKey()), "%" + criteria.getValue() + "%");
            } else {
                return builder.equal(root.get(criteria.getKey()), criteria.getValue());
            }
        }
        return null;
    }
}
