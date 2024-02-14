package db;

import tasks.Tasks;

import java.util.ArrayList;

public class DBManager {
    public static ArrayList<Tasks> tasks = new ArrayList<>();

    public static Long id = 6L;

    static {
        tasks.add(new Tasks(1L, "Создать Веб приложение на Java EE", "Создать Веб приложение на Java EE для себя.","23.10.2021", true));
        tasks.add(new Tasks(2L, "Убраться дома и закупить продукты", "Убраться дома и закупить продукты на выходные.","25.10.2021", true));
        tasks.add(new Tasks(3L, "Выполнить все домашние задания", "Выполнить все домашние задания в срок.","28.10.2021", false));
        tasks.add(new Tasks(4L, "Записаться на качку", "Записаться на качку для развития.","12.12.2021", false));
        tasks.add(new Tasks(5L, "Учить Итальянский", "Учить Итальянский до летних каникул.","01.05.2022", false));
    }
    public static ArrayList<Tasks> getAllTasks(){
        return tasks;
    }
    public static void addTask(Tasks task) {
        task.setId(id);
        task.setStatus(false);
        tasks.add(task);
        id++;
    }
    public static Tasks getTask(Long id) {
        for (Tasks task : tasks) {
            if (task.getId().equals(id)) {
                return task;
            }
        }
        return null;
    }
    public static void deleteTask(Long id) {

        tasks.removeIf(task -> task.getId().equals(id));
    }
public static Tasks updateTask(Tasks task){
    for (int i = 0; i < tasks.size(); i++) {
        if(tasks.get(i).getId()== task.getId()){
            tasks.set(i,task);
            return task;
        }
    }
    return null;
    }
}
