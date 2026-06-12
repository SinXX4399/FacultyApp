import { BrowserRouter, Routes, Route } from "react-router-dom";
import LoginPage from "./pages/LoginPage";
import DashboardPage from "./pages/Dashboard/DashboardPage";
import CreatePostPage from "./pages/CreatePostPage";
import AdminLayout from "./layouts/AdminLayout";
import StudentPage from "./pages/StudentPage";

function App() {
  return (
    <BrowserRouter>
    <Routes>
      <Route path="/" element={<AdminLayout />}>
        <Route index element={<DashboardPage />} />
        <Route path="createPosts" element={<CreatePostPage />} />
        <Route path="students" element={<StudentPage />}/>
        
      </Route>
    </Routes>
  </BrowserRouter>
  );
}

export default App;