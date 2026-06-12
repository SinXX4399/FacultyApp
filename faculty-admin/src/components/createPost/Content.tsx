import React, { useState } from "react";
import {
  Box,
  Button,
  IconButton,
  Paper,
  TextField,
  Typography,
} from "@mui/material";
import LinkIcon from "@mui/icons-material/Link";

import ImageIcon from "@mui/icons-material/Image";
import CloseIcon from "@mui/icons-material/Close";

import Lightbox from "yet-another-react-lightbox";
import Zoom from "yet-another-react-lightbox/plugins/zoom";
import ContentEditor from "./ContentEditor";
import "yet-another-react-lightbox/styles.css";
import Linkify from "linkify-react";

export default function Content() {
  const [content, setContent] = useState("");

  const [images, setImages] = useState<File[]>([]);
  const urlRegex = /(https?:\/\/[^\s]+)/g;

  const links = content.match(urlRegex) || [];
  const [lightboxOpen, setLightboxOpen] =
    useState(false);

  const [currentIndex, setCurrentIndex] =
    useState(0);

  const handleImageChange = (
    e: React.ChangeEvent<HTMLInputElement>
  ) => {
    if (!e.target.files) return;

    setImages((prev) => [
      ...prev,
      ...Array.from(e.target.files),
    ]);
  };

  const removeImage = (index: number) => {
    setImages((prev) =>
      prev.filter((_, i) => i !== index)
    );
  };

  const slides = images.map((image) => ({
    src: URL.createObjectURL(image),
  }));

  return (
    <>
      <Paper
        sx={{
          p: 3,
          borderRadius: 1,
          mb: 3,
        }}
      >
        <Typography
          sx={{
            fontWeight: 600,
            mb: 2,
          }}
        >
          Content
        </Typography>

        {/* Upload Button */}

        <Button
          component="label"
          startIcon={<ImageIcon />}
          variant="outlined"
          sx={{ mb: 3, mr: 2 }}
        >
          Add Images

          <input
            hidden
            multiple
            accept="image/*"
            type="file"
            onChange={handleImageChange}
          />
        </Button>




        {/* Image Preview */}

        {images.length > 0 && (
          <Box
            sx={{
              display: "grid",
              gridTemplateColumns:
                "repeat(2, 1fr)",
              gap: 1,
              mb: 3,
            }}
          >
            {images
              .slice(0, 4)
              .map((image, index) => {
                const remainingImages =
                  images.length - 4;

                const showOverlay =
                  index === 3 &&
                  images.length > 4;

                return (
                  <Box
                    key={index}
                    sx={{
                      position: "relative",
                      height: 220,
                    }}
                  >
                    <Box
                      component="img"
                      src={URL.createObjectURL(
                        image
                      )}
                      onClick={() => {
                        setCurrentIndex(index);
                        setLightboxOpen(true);
                      }}
                      sx={{
                        width: "100%",
                        height: "100%",
                        objectFit: "cover",
                        cursor: "pointer",
                        borderRadius: 2,
                      }}
                    />

                    {/* Remove Button */}

                    <IconButton
                      onClick={() =>
                        removeImage(index)
                      }
                      sx={{
                        position: "absolute",
                        top: 8,
                        right: 8,
                        bgcolor:
                          "rgba(0,0,0,0.6)",
                        color: "white",

                        "&:hover": {
                          bgcolor:
                            "rgba(0,0,0,0.8)",
                        },
                      }}
                    >
                      <CloseIcon />
                    </IconButton>

                    {/* +N Overlay */}

                    {showOverlay && (
                      <Box
                        sx={{
                          position:
                            "absolute",
                          inset: 0,

                          bgcolor:
                            "rgba(0,0,0,0.55)",

                          borderRadius: 2,

                          display: "flex",
                          alignItems:
                            "center",
                          justifyContent:
                            "center",
                        }}
                      >
                        <Typography
                          variant="h3"
                          sx={{
                            color:
                              "white",
                            fontWeight: 700,
                          }}
                        >
                          +{remainingImages}
                        </Typography>
                      </Box>
                    )}
                  </Box>
                );
              })}
          </Box>
        )}

        {/* Content */}

        <Box
          sx={{
            border: "1px solid",
            borderColor: "divider",
            borderRadius: 2,
            p: 2,

            "& .ProseMirror": {
              minHeight: 180,
              maxHeight: 280,
             overflowY: "auto",
              outline: "none",
            },
          }}
        >
          <ContentEditor />
        </Box>

      </Paper>

      {/* Lightbox */}

      <Lightbox
        open={lightboxOpen}
        close={() =>
          setLightboxOpen(false)
        }
        slides={slides}
        index={currentIndex}
        plugins={[Zoom]}
        carousel={{
          finite: true,
        }}
        controller={{
          closeOnBackdropClick: true,
        }}
        on={{
          view: ({ index }) => {
            setCurrentIndex(index);
          },
        }}
        render={{
          controls: () => (
            <Box
              sx={{
                position: "absolute",
                bottom: 20,
                right: 20,

                bgcolor:
                  "rgba(0,0,0,0.6)",

                color: "white",

                px: 2,
                py: 1,

                borderRadius: 10,
                fontSize: 14,
              }}
            >
              {currentIndex + 1} /{" "}
              {slides.length}
            </Box>
          ),
        }}
      />
    </>
  );
}