// services/studentService.ts

export async function getStudents() {
    const response = await fetch(
      "http://localhost:8000/students"
    );
  
    return response.json();
}

