/****** Object:  Table [dbo].[PlaylistImage]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PlaylistImage](
	[Id] [uniqueidentifier] NOT NULL,
	[PlaylistId] [uniqueidentifier] NOT NULL,
	[Width] [smallint] NOT NULL,
	[Height] [smallint] NOT NULL,
	[Uri] [char](40) NOT NULL,
 CONSTRAINT [PK_PlaylistImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[PlaylistImage] ADD  CONSTRAINT [DF_PlaylistImage_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[PlaylistImage]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistImage_Playlist] FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[Playlist] ([Id])
ALTER TABLE [dbo].[PlaylistImage] CHECK CONSTRAINT [FK_PlaylistImage_Playlist]