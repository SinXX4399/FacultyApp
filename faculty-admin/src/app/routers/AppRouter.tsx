import {
    BrowserRouter,
    Routes,
    Route,
  } from "react-router-dom";
  
  import AdminLayout from "../../layouts/AdminLayout";
  
  import DashboardPage from "../../pages/Dashboard/DashboardPage";
  import UsersPage from "../../pages/Users/UsersPage";
  import PostsPage from "../../pages/Posts/PostsPage";
  import SettingsPage from "../../pages/Settings/SettingsPage";
  
  export default function AppRouter() {
    return (
      <BrowserRouter>
        <Routes>
          <Route
            path="/admin"
            element={<AdminLayout />}
          >
            <Route index element={<DashboardPage />} />
            <Route path="users" element={<UsersPage />} />
            <Route path="posts" element={<PostsPage />} />
            <Route path="settings" element={<SettingsPage />} />
          </Route>
        </Routes>
      </BrowserRouter>
    );
  }