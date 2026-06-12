import {
  Box,
  Button,
  Paper,
  TextField,
  Typography,
  IconButton,

} from "@mui/material";

import ArrowBackIcon from "@mui/icons-material/ArrowBack";



import "yet-another-react-lightbox/styles.css";



import Receivers from "../components/createPost/Receivers";
import Deadline from "../components/createPost/Deadline";
import Content from "../components/createPost/Content";
import FileDropZone from "../components/createPost/FileDrop";

export default function CreatePostPage() {

 


  return (
    //main container
    <Box
      sx={{
        flex: 1,
        p: 4,
        bgcolor: "#F7F7F8",
        minHeight: "100vh",
      }}
    >

      <Box
        sx={{ //header section
          display: "flex",
          alignItems: "center",
          justifyContent: "space-between",
          mb: 4,
        }}
      >
        <Box
          sx={{
            display: "flex",
            alignItems: "center",
            gap: 2,
          }}
        >
          <IconButton>
            <ArrowBackIcon />
          </IconButton>

          <Typography sx={{ variant: "h4", fontWeigh: 700 }}>
            Create New Post
          </Typography>
        </Box>

        <Typography color="text.secondary">
          {new Date().toLocaleDateString()}
        </Typography>
      </Box>

      <Paper //title section
        sx={{
          p: 3,
          borderRadius: 1,
          mb: 3,
        }}
      >
        <Typography sx={{ fontWeight: 600, mb: 2 }} >
          Post Title
        </Typography>

        <TextField
          fullWidth
          placeholder="Enter title..."
        />
      </Paper>

      {/*******************Content section ***************************/}


      <Content />
      {/************Drop File  Section*********************************** */}

      <FileDropZone />
      <Box sx={{ height: 24 }} />


      {/*******************Deadline Section ***************************/}

      <Deadline />

      {/*******************Receivers section  ***************************/}
      <Receivers />

      {/*******************Submit Button  ***************************/}
      <Box sx={{height:"24px"}}/>
      <Box sx={{ display: "flex", justifyContent: "center" }}>
        <Button variant="contained" sx={{ mr: 3 }}>
          Publish
        </Button>

        <Button variant="outlined">
          Save Draft
        </Button>
      </Box>


    </Box>//main container end
  );


}