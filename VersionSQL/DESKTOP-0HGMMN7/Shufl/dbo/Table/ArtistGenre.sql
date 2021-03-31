/****** Object:  Table [dbo].[ArtistGenre]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ArtistGenre](
	[Id] [uniqueidentifier] NOT NULL,
	[ArtistId] [uniqueidentifier] NOT NULL,
	[GenreId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ArtistGenre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE UNIQUE NONCLUSTERED INDEX [IX_ArtistGenre_ArtistId_GenreId] ON [dbo].[ArtistGenre]
(
	[ArtistId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[ArtistGenre] ADD  CONSTRAINT [DF_ArtistGenre_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[ArtistGenre]  WITH CHECK ADD  CONSTRAINT [FK_ArtistGenre_Artist] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artist] ([Id])
ALTER TABLE [dbo].[ArtistGenre] CHECK CONSTRAINT [FK_ArtistGenre_Artist]
ALTER TABLE [dbo].[ArtistGenre]  WITH CHECK ADD  CONSTRAINT [FK_ArtistGenre_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([Id])
ALTER TABLE [dbo].[ArtistGenre] CHECK CONSTRAINT [FK_ArtistGenre_Genre]