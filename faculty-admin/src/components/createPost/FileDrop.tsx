import { useCallback, useState } from "react";
import {
    Box,
    IconButton,
    List,
    ListItem,
    ListItemIcon,
    ListItemText,
    Paper,
    Typography,
} from "@mui/material";


import InsertDriveFileIcon from "@mui/icons-material/InsertDriveFile";
import PictureAsPdfIcon from "@mui/icons-material/PictureAsPdf";
import ImageIcon from "@mui/icons-material/Image";
import DescriptionIcon from "@mui/icons-material/Description";
import TableChartIcon from "@mui/icons-material/TableChart";
import ArchiveIcon from "@mui/icons-material/Archive";
import VideoFileIcon from "@mui/icons-material/VideoFile";
import AudioFileIcon from "@mui/icons-material/AudioFile";
import DeleteIcon from "@mui/icons-material/Delete";
import { useDropzone } from "react-dropzone";

const getFileIcon = (file: File) => {
    const type = file.type;

    if (type.startsWith("image/")) {
        return <ImageIcon color="success" />;
    }

    if (type === "application/pdf") {
        return <PictureAsPdfIcon color="error" />;
    }

    if (
        type.includes("word") ||
        file.name.endsWith(".doc") ||
        file.name.endsWith(".docx")
    ) {
        return <DescriptionIcon color="primary" />;
    }

    if (
        type.includes("sheet") ||
        file.name.endsWith(".xls") ||
        file.name.endsWith(".xlsx")
    ) {
        return <TableChartIcon color="success" />;
    }

    if (
        type.includes("zip") ||
        type.includes("rar") ||
        file.name.endsWith(".zip")
    ) {
        return <ArchiveIcon color="warning" />;
    }

    if (type.startsWith("video/")) {
        return <VideoFileIcon color="secondary" />;
    }

    if (type.startsWith("audio/")) {
        return <AudioFileIcon color="info" />;
    }

    return <InsertDriveFileIcon />;
};



export default function FileDropZone() {
    const [files, setFiles] = useState<File[]>([]);

    const onDrop = useCallback((acceptedFiles: File[]) => {
        setFiles((prev) => [...prev, ...acceptedFiles]);
    }, []);

    const removeFile = (indexToRemove: number) => {
        setFiles((prev) =>
            prev.filter((_, index) => index !== indexToRemove)
        );
    };

    const {
        getRootProps,
        getInputProps,
        isDragActive,
    } = useDropzone({
        onDrop,
        multiple: true,
    });

    return (
        <Box>
            <Paper
                {...getRootProps()}
                sx={{
                    p: 4,
                    border: "2px dashed",
                    borderColor: isDragActive
                        ? "primary.main"
                        : "divider",
                    borderRadius: 2,
                    textAlign: "center",
                    cursor: "pointer",
                }}
            >
                <input {...getInputProps()} />

                <Typography variant="h6">
                    {isDragActive
                        ? "Drop files here..."
                        : "Drag & drop files here"}
                </Typography>

                <Typography
                    variant="body2"
                    color="text.secondary"
                >
                    or click to browse
                </Typography>
            </Paper>

            {files.length > 0 && (
                <List sx={{ mt: 2 }}>
                    {files.map((file, index) => (
                        <ListItem
                            key={`${file.name}-${index}`}
                            secondaryAction={
                                <IconButton
                                    edge="end"
                                    onClick={() => removeFile(index)}
                                >
                                    <DeleteIcon />
                                </IconButton>
                            }
                        >
                            <ListItemIcon>
                                {getFileIcon(file)}
                            </ListItemIcon>

                            <ListItemText
                                primary={file.name}
                                secondary={`${(
                                    file.size / 1024
                                ).toFixed(2)} KB`}
                            />
                        </ListItem>
                    ))}
                </List>
            )}
        </Box>
    );
}