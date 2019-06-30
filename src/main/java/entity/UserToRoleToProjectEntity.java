package entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by istvolov on 28.06.19.
 */
@Entity
@Table(name = "user_to_role_to_project", schema = "public", catalog = "hibernate_example")
public class UserToRoleToProjectEntity implements Serializable {

    @Id
    @ManyToOne
    @JoinColumn(name = "employe_id")
    private EmployeEntity employeEntity;

    @Id
    @ManyToOne
    @JoinColumn(name = "project_id")
    private ProjectEntity projectEntity;

    @Id
    @ManyToOne
    @JoinColumn(name = "role_id")
    private RoleEntity roleEntity;


    public EmployeEntity getEmployeEntity() {
        return employeEntity;
    }

    public void setEmployeEntity(EmployeEntity employeEntity) {
        this.employeEntity = employeEntity;
    }

    public ProjectEntity getProjectEntity() {
        return projectEntity;
    }

    public void setProjectEntity(ProjectEntity projectEntity) {
        this.projectEntity = projectEntity;
    }

    public RoleEntity getRoleEntity() {
        return roleEntity;
    }

    public void setRoleEntity(RoleEntity roleEntity) {
        this.roleEntity = roleEntity;
    }
}
