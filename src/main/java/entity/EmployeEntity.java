package entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by istvolov on 28.06.19.
 */
@Entity
@Table(name = "employe", schema = "public", catalog = "hibernate_example")
public class EmployeEntity {

    @Id
    @Column(name = "id")
    private long id;

    @Basic
    @Column(name = "name")
    private String name;

    @Basic
    @Column(name = "surname")
    private String surname;

    @Basic
    @Column(name = "middlename")
    private String middlename;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "user_to_role_to_project",
            joinColumns = {@JoinColumn(name = "employe_id")},
            inverseJoinColumns = @JoinColumn(name = "project_id"))
    private List<ProjectEntity> projectEntityList = new ArrayList<>();

    @OneToMany(mappedBy = "employeEntity")
    private List<UserToRoleToProjectEntity> userToRoleToProjectEntity;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }


    public String getMiddlename() {
        return middlename;
    }

    public void setMiddlename(String middlename) {
        this.middlename = middlename;
    }

    public List<ProjectEntity> getProjectEntityList() {
        return projectEntityList;
    }

    public void setProjectEntityList(List<ProjectEntity> projectEntityList) {
        this.projectEntityList = projectEntityList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EmployeEntity that = (EmployeEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (surname != null ? !surname.equals(that.surname) : that.surname != null) return false;
        if (middlename != null ? !middlename.equals(that.middlename) : that.middlename != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (surname != null ? surname.hashCode() : 0);
        result = 31 * result + (middlename != null ? middlename.hashCode() : 0);
        return result;
    }
}
