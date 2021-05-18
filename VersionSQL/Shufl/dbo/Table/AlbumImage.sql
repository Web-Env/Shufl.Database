/****** Object:  Table [dbo].[AlbumImage]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AlbumImage](
	[Id] [uniqueidentifier] NOT NULL,
	[AlbumId] [uniqueidentifier] NOT NULL,
	[Width] [smallint] NOT NULL,
	[Height] [smallint] NOT NULL,
	[Uri] [char](40) NOT NULL,
 CONSTRAINT [PK_AlbumImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_AlbumImage_AlbumId] ON [dbo].[AlbumImage]
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[AlbumImage] ADD  CONSTRAINT [DF_AlbumImage_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[AlbumImage]  WITH CHECK ADD  CONSTRAINT [FK_AlbumImage_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Album] ([Id])
ALTER TABLE [dbo].[AlbumImage] CHECK CONSTRAINT [FK_AlbumImage_Album]