import { Paper, Typography } from "@mui/material";
import type {Stat} from "../types/stat";

interface Props {
    stat:Stat
}
export default function Card({stat}:Props) {
    return (
      <Paper
        sx={{
          p: 3,
          borderRadius: 3,
          height: 150,
        }}
      >
        <Typography variant="h6">
          {stat.name}
        </Typography>
        <Typography variant="h4" sx={{ mt: 1 }}>
            {stat.number}
        </Typography>
      </Paper>
    );
  }