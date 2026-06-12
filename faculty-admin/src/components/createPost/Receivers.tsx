import { Box, Paper, Typography, FormControl, InputLabel, Select, MenuItem } from "@mui/material";

import { useState } from "react";
import { Form } from "react-router-dom";
export default function Receivers() {
    const [faculty, setFaculty] = useState("");
    const [major, setMajor] = useState("");
    const [department, setDepartment] = useState("");
    const [studentId, setStudentId] = useState("");



    return (
        <Paper
            sx={{
                p: 3,
                borderRadius: 1,
                height: 350,
            }}
        > <Typography sx={{ mb: 2, variant: "h7" }}>
                Receivers
            </Typography>
            <Box sx={{ display: "grid",
             gridTemplateColumns: "repeat(auto-fit, minmax(200px, 2fr))",
             gap: 5,
             px: 3, }}>
                <FormControl >
                    <InputLabel>Faculty</InputLabel>
                    <Select
                        value={faculty}
                        label="Faculty"
                        onChange={(e) => setFaculty(e.target.value)}
                    >
                        <MenuItem value="all">All</MenuItem>
                        <MenuItem value="DIT">Digital Innovation and Technology</MenuItem>
                        <MenuItem value="EG">Engineering</MenuItem>
                        <MenuItem value="ME">Medical</MenuItem>
                    </Select>
                </FormControl>

                <FormControl >
                    <InputLabel>Major</InputLabel>
                    <Select
                        value={major}
                        label="Major"
                        onChange={(e) => setMajor(e.target.value)}
                    >
                        <MenuItem value="all">All</MenuItem>
                        <MenuItem value="CS">Computer Science</MenuItem>
                        <MenuItem value="CGE">Computer Game and Esport</MenuItem>
                    </Select>
                </FormControl>

                <FormControl >
                    <InputLabel>Department</InputLabel>
                    <Select
                        value={department}
                        label="Department"
                        onChange={(e) => setDepartment(e.target.value)}
                    >
                        <MenuItem value="all">All</MenuItem>
                        <MenuItem value="Thai">Thai</MenuItem>
                        <MenuItem value="International">International</MenuItem>
                    </Select>
                    </FormControl>

                    <FormControl>
                    <InputLabel>StudentId</InputLabel>
                    <Select
                        value={studentId}
                        label="StudentId"
                        onChange={(e) => setStudentId(e.target.value)}
                    >
                        <MenuItem value="all">All</MenuItem>
                        <MenuItem value="65">65</MenuItem>
                        <MenuItem value="66">66</MenuItem>
                    </Select>
                    </FormControl>

            
            </Box>
        </Paper>
    );
}