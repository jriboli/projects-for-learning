package com.binaryNomad;

import com.binaryNomad.lambda.basics.StaticMethod_StringHelper;
import com.binaryNomad.lambda.exercise_001.Employee;
import com.binaryNomad.lambda.exercise_001.Measurable;
import com.binaryNomad.lambda.exercise_002.IntSequence;
import com.binaryNomad.lambda.exercise_002.IntSequenceUtil;

import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // BASICS
        staticMethod();

        // EXERCISE 001
        Employee[] employees = {
          new Employee("Alice", 50000),
          new Employee("Bob", 60000),
          new Employee("Charlie", 70000)
        };

        double averageSalary = average(employees);
        System.out.println("Average salary: " + averageSalary);

        Employee highestPaid = (Employee) largest(employees);
        System.out.println("Highest paid employee: " + highestPaid.getName());

        // EXERCISE 002
        // Lambda Expressions: Lambda expressions can only be used with functional interfaces.
        // Since IntSequence has multiple methods, we use anonymous inner classes instead.
        IntSequence sequence = IntSequenceUtil.of(3, 1, 4, 1, 5, 9);
        while (sequence.hasNext()) {
            System.out.print(sequence.next() + " ");
        }
        System.out.println();

        IntSequence constantSeq = IntSequenceUtil.constant(1);
        for (int i = 0; i < 10; i++) {
            System.out.print(constantSeq.next() + " ");
        }
    }

    public static void staticMethod() {
        List<String> messages = Arrays.asList("hello", "revature", "associates!");

        // Using the method reference, that utilizes the :: operator
        messages.forEach(StaticMethod_StringHelper::printAsCapital);
    }

    public static double average(Measurable[] objects) {
        double sum = 0;
        for (Measurable obj : objects) {
            sum += obj.getMeasure();
        }

        return objects.length > 0 ? sum / objects.length : 0;
    }

    public static Measurable largest(Measurable[] objects) {
        if(objects.length == 0) {
            return null;
        }

        Measurable largest = objects[0];
        for (Measurable obj : objects) {
            if (obj.getMeasure() > largest.getMeasure())
                largest = obj;
        }

        return largest;
    }
}