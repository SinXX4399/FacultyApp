import { useMemo, useState } from "react";
import { Box, TextField } from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";
import type { Student } from "../types/student";

import { useEffect } from "react";
import { getStudents } from "../services/studentService";
import type {
  GridColDef,
  GridRowSelectionModel,
} from "@mui/x-data-grid";




const [students, setStudents] = useState<Student[]>([]);
const [loading, setLoading] = useState(true);


useEffect(() => {
    const fetchStudents = async ()=>{
        try{
            const response = await fetch("/api/students");
            const data = await response.json();

            setStudents(data);
        }
        catch(error){
            console.error("Error fetching students:", error);
        }
        finally{
            setLoading(false);
        }
    };
    fetchStudents();
})


export default function StudentTable() {
  const [search, setSearch] = useState("");
  const [selectedRows, setSelectedRows] =
    useState<GridRowSelectionModel>([]);

  const columns: GridColDef[] = [
    {
      field: "student_id",
      headerName: "Student ID",
      flex: 1,
    },
    {
      field: "name",
      headerName: "Name",
      flex: 1.5,
    },
    {
      field: "email",
      headerName: "Email",
      flex: 2,
    },
    {
      field: "major",
      headerName: "Major",
      flex: 1.5,
    },
  ];

  const filteredRows = useMemo(() => {
    return students.filter((student) =>
      Object.values(student)
        .join(" ")
        .toLowerCase()
        .includes(search.toLowerCase())
    );
  }, [search]);

  return (
    <Box sx={{ p: 3 }}>
      <TextField
        label="Search Students"
        fullWidth
        sx={{ mb: 2 }}
        value={search}
        onChange={(e) => setSearch(e.target.value)}
      />

      <DataGrid
        rows={filteredRows}
        columns={columns}
        loading={loading}
        checkboxSelection
        disableRowSelectionOnClick
        pageSizeOptions={[5, 10, 25, 50]}
        initialState={{
          pagination: {
            paginationModel: {
              pageSize: 10,
              page: 0,
            },
          },
        }}
        onRowSelectionModelChange={(newSelection) =>
          setSelectedRows(newSelection)
        }
      />
    </Box>
  );
}