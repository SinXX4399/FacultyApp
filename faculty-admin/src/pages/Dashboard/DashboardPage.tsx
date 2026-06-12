import { Box,Fab } from "@mui/material";
import AddIcon from "@mui/icons-material/Add";
import Sidebar from "../../components/Sidebar";
import Card from "../../components/Card";
import Appbar from "../../components/Appbar";
import PostCard from "../../components/PostCard";
export default function DashboardPage() {
  return (
    <>
      <Box sx={{ height: "100vh",display:"flex" }} >
      
      <Box sx={{display:"flex",flexDirection:"Row",}}>

      </Box>
      <Box sx={{ display: "flex",flexDirection:"column", gap: 3, minHeight: "100vh" ,width:"100%"}}>


      <Box
  sx={{
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit, minmax(200px, 1fr))",
    gap: 3,
    px: 3,
  }}
>
          <Card stat={{name:"Total Posts",number:10}}/>
          <Card stat={{name:"Active Posts",number:5}}/>
          <Card stat={{name:"Expired Posts",number:7}} />

        </Box>
        <Box sx={{ px: 3 , minHeight:"10vh"}}/>
        <Box sx={{
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit, minmax(250px, 1fr))",
    gap: 3,
    px: 3,
  }}>
          <PostCard post={{ id: 1, title: "Post 1", content: "Content of post 1", created_at: new Date().toISOString() }} />
          <PostCard post={{ id: 1, title: "Post 1", content: "Content of post 1", created_at: new Date().toISOString() }} />
          <PostCard post={{ id: 1, title: "Post 1", content: "Content of post 1", created_at: new Date().toISOString() }} />
          <PostCard post={{ id: 1, title: "Post 1", content: "Content of post 1", created_at: new Date().toISOString() }} />
          <PostCard post={{ id: 1, title: "Post 1", content: "Content of post 1", created_at: new Date().toISOString() }} />
          <PostCard post={{ id: 1, title: "Post 1", content: "Content of post 1", created_at: new Date().toISOString() }} />

       
       
        </Box>
      </Box> 
      </Box>
      <Fab
  color="primary"
  sx={{
    position: "fixed",
    bottom: 24,
    right: 24,
  }}
>
  <AddIcon />
</Fab>
      
    </>
  );
}