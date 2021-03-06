/****** Object:  Table [dbo].[AlbumArtist]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AlbumArtist](
	[Id] [uniqueidentifier] NOT NULL,
	[AlbumId] [uniqueidentifier] NOT NULL,
	[ArtistId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_AlbumArtist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_AlbumArtist_AlbumId] ON [dbo].[AlbumArtist]
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
CREATE UNIQUE NONCLUSTERED INDEX [IX_AlbumArtist_AlbumId_ArtistId] ON [dbo].[AlbumArtist]
(
	[AlbumId] ASC,
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [IX_AlbumArtist_ArtistId] ON [dbo].[AlbumArtist]
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[AlbumArtist] ADD  CONSTRAINT [DF_AlbumArtist_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[AlbumArtist]  WITH CHECK ADD  CONSTRAINT [FK_AlbumArtist_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Album] ([Id])
ALTER TABLE [dbo].[AlbumArtist] CHECK CONSTRAINT [FK_AlbumArtist_Album]
ALTER TABLE [dbo].[AlbumArtist]  WITH CHECK ADD  CONSTRAINT [FK_AlbumArtist_Artist] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artist] ([Id])
ALTER TABLE [dbo].[AlbumArtist] CHECK CONSTRAINT [FK_AlbumArtist_Artist]