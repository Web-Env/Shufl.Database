/****** Object:  Table [dbo].[GroupAlbumRating]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GroupAlbumRating](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupAlbumId] [uniqueidentifier] NOT NULL,
	[OverallRating] [decimal](3, 1) NOT NULL,
	[LyricsRating] [decimal](3, 1) NULL,
	[VocalsRating] [decimal](3, 1) NULL,
	[InstrumentalsRating] [decimal](3, 1) NULL,
	[StructureRating] [decimal](3, 1) NULL,
	[Comment] [nvarchar](1500) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GroupAlbumRating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_GroupAlbumRating] ON [dbo].[GroupAlbumRating]
(
	[GroupAlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[GroupAlbumRating] ADD  CONSTRAINT [DF_GroupSuggestionRating_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[GroupAlbumRating]  WITH CHECK ADD  CONSTRAINT [FK_GroupAlbumRating_GroupAlbum] FOREIGN KEY([GroupAlbumId])
REFERENCES [dbo].[GroupAlbum] ([Id])
ALTER TABLE [dbo].[GroupAlbumRating] CHECK CONSTRAINT [FK_GroupAlbumRating_GroupAlbum]
ALTER TABLE [dbo].[GroupAlbumRating]  WITH CHECK ADD  CONSTRAINT [FK_GroupAlbumRating_User_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[GroupAlbumRating] CHECK CONSTRAINT [FK_GroupAlbumRating_User_CreatedBy]
ALTER TABLE [dbo].[GroupAlbumRating]  WITH CHECK ADD  CONSTRAINT [FK_GroupAlbumRating_User_LastUpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[GroupAlbumRating] CHECK CONSTRAINT [FK_GroupAlbumRating_User_LastUpdatedBy]