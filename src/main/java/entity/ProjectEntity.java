package entity;

import javax.persistence.*;
import java.util.List;

/**
 * Created by istvolov on 28.06.19.
 */
@Entity
@Table(name = "project", schema = "public", catalog = "project_test")
public class ProjectEntity {

    @Id
    @Column(name = "id")
    private long id;

    @Basic
    @Column(name = "name")
    private String name;


    @ManyToMany
    @JoinTable(name = "user_to_role_to_project",
            joinColumns = {@JoinColumn(name = "project_id")},
            inverseJoinColumns = @JoinColumn(name = "employe_id"))
    private List<EmployeEntity> employeEntitieList;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProjectEntity that = (ProjectEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
