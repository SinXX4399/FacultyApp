import {
  Box,
  Card,
  Chip,
  Typography,
} from "@mui/material";

import CalendarTodayIcon from "@mui/icons-material/CalendarToday";
import MonitorIcon from "@mui/icons-material/Monitor";

import type { Post } from "../types/post";

interface Props {
  post: Post;
}

export default function PostCard({ post }: Props) {
  return (
    <Card
      sx={{
        p: 2,
        borderRadius: 1,
        border: "1px solid #ECECEC",
      }}
    >
      <Box
        sx={{
          display: "flex",
          alignItems: "center",
          gap: 1,
          color: "#9E9E9E",
        }}
      >
        <CalendarTodayIcon sx={{ fontSize: 16 }} />

        <Typography variant="body2">
          {new Date(post.created_at).toLocaleString()}
        </Typography>
      </Box>

      <Box
        sx={{
          mt: 2,
          height: 120,
          borderRadius: 3,
          bgcolor: "#FFF5F5",
          border: "1px solid #FFDADA",
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
      >
        <MonitorIcon
          sx={{
            fontSize: 40,
            color: "#E6AAA4",
          }}
        />
      </Box>

      <Typography
        variant="h6"
        sx={{
          mt: 2,
          fontWeight: 600,
        }}
      >
        {post.title}
      </Typography>

      <Box
        sx={{
          mt: 2,
          display: "flex",
          justifyContent: "space-between",
        }}
      >
        <Typography variant="body2">
          Status: {post.status}
        </Typography>

        <Chip
          label={post.status}
          size="small"
        />
      </Box>
    </Card>
  );
}