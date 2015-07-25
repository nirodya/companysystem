package com.actop.db;
// Generated Jul 24, 2015 12:22:50 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * TaskPriority generated by hbm2java
 */
@Entity
@Table(name="task_priority"
    ,catalog="actop_system"
)
public class TaskPriority  implements java.io.Serializable {


     private Integer idTaskPriority;
     private String taskPriority;

    public TaskPriority() {
    }

    public TaskPriority(String taskPriority) {
       this.taskPriority = taskPriority;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID_TASK_PRIORITY", unique=true, nullable=false)
    public Integer getIdTaskPriority() {
        return this.idTaskPriority;
    }
    
    public void setIdTaskPriority(Integer idTaskPriority) {
        this.idTaskPriority = idTaskPriority;
    }

    
    @Column(name="TASK_PRIORITY", length=45)
    public String getTaskPriority() {
        return this.taskPriority;
    }
    
    public void setTaskPriority(String taskPriority) {
        this.taskPriority = taskPriority;
    }




}


