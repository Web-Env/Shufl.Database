﻿/****** Object:  Table [dbo].[GroupSuggestionRating]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GroupSuggestionRating](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupSuggestionId] [uniqueidentifier] NOT NULL,
	[OverallRating] [decimal](3, 1) NOT NULL,
	[LyricsRating] [decimal](3, 1) NULL,
	[VocalsRating] [decimal](3, 1) NULL,
	[InstrumentalsRating] [decimal](3, 1) NULL,
	[CompositionRating] [decimal](3, 1) NULL,
	[Comment] [nvarchar](1500) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GroupSuggestionRating] PRIMARY KEY CLUSTERED 
(
	[Id] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_GroupSuggestionRating] ON [dbo].[GroupSuggestionRating]
(
	[GroupSuggestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[GroupSuggestionRating] ADD  CONSTRAINT [DF_GroupSuggestionRating_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[GroupSuggestionRating]  WITH CHECK ADD  CONSTRAINT [FK_GroupSuggestionRating_GroupSuggestion] FOREIGN KEY([GroupSuggestionId])
REFERENCES [dbo].[GroupSuggestion] ([Id])
ALTER TABLE [dbo].[GroupSuggestionRating] CHECK CONSTRAINT [FK_GroupSuggestionRating_GroupSuggestion]
ALTER TABLE [dbo].[GroupSuggestionRating]  WITH CHECK ADD  CONSTRAINT [FK_GroupSuggestionRating_User_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[GroupSuggestionRating] CHECK CONSTRAINT [FK_GroupSuggestionRating_User_CreatedBy]
ALTER TABLE [dbo].[GroupSuggestionRating]  WITH CHECK ADD  CONSTRAINT [FK_GroupSuggestionRating_User_LastUpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[GroupSuggestionRating] CHECK CONSTRAINT [FK_GroupSuggestionRating_User_LastUpdatedBy]