/*
  Warnings:

  - You are about to drop the `Example` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `role_id` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type_id` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "User" ADD COLUMN     "avatar" TEXT,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "role_id" INTEGER NOT NULL,
ADD COLUMN     "status" INTEGER NOT NULL DEFAULT 1,
ADD COLUMN     "type_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "Example";

-- DropTable
DROP TABLE "Post";

-- CreateTable
CREATE TABLE "Progress" (
    "id" SERIAL NOT NULL,
    "progress" TEXT NOT NULL,

    CONSTRAINT "Progress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Roles" (
    "id" SERIAL NOT NULL,
    "role" TEXT NOT NULL,

    CONSTRAINT "User_Roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Achivements" (
    "id" SERIAL NOT NULL,
    "achivement" TEXT NOT NULL,

    CONSTRAINT "Achivements_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Course_Difficulties" (
    "id" SERIAL NOT NULL,
    "difficulty" TEXT NOT NULL,

    CONSTRAINT "Course_Difficulties_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Courses_Tags" (
    "id" SERIAL NOT NULL,
    "tag" TEXT NOT NULL,

    CONSTRAINT "Courses_Tags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Course_Categories" (
    "id" SERIAL NOT NULL,
    "category" TEXT NOT NULL,

    CONSTRAINT "Course_Categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Types" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "User_Types_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Achivements" (
    "achievement_id" INTEGER NOT NULL,
    "user_id" TEXT NOT NULL,
    "achivement_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_Achivements_pkey" PRIMARY KEY ("achievement_id","user_id")
);

-- CreateTable
CREATE TABLE "Courses" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "short_description" TEXT,
    "long_description" TEXT,
    "duration" BIGINT NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 1,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "creator_user_id" TEXT NOT NULL,
    "category_id" INTEGER NOT NULL,
    "difficulty_id" INTEGER NOT NULL,

    CONSTRAINT "Courses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Course_Enrollment" (
    "course_id" INTEGER NOT NULL,
    "user_id" TEXT NOT NULL,
    "enrollment_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "graduation_date" TIMESTAMP(3),
    "progress_id" INTEGER NOT NULL,

    CONSTRAINT "User_Course_Enrollment_pkey" PRIMARY KEY ("course_id","user_id")
);

-- CreateTable
CREATE TABLE "Course_Tags" (
    "tag_id" INTEGER NOT NULL,
    "course_id" INTEGER NOT NULL,

    CONSTRAINT "Course_Tags_pkey" PRIMARY KEY ("course_id","tag_id")
);

-- CreateTable
CREATE TABLE "Course_Modules" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 1,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "course_id" INTEGER NOT NULL,

    CONSTRAINT "Course_Modules_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Assignments" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "assignment_content" TEXT NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 1,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "module_id" INTEGER NOT NULL,

    CONSTRAINT "Assignments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Projects" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "project_content" TEXT NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 1,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "module_id" INTEGER NOT NULL,

    CONSTRAINT "Projects_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Quizzes" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "quizz_content" TEXT NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 1,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "module_id" INTEGER NOT NULL,

    CONSTRAINT "Quizzes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Lessons" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "lesson_content" TEXT NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 1,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "module_id" INTEGER NOT NULL,

    CONSTRAINT "Lessons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Module_Progress" (
    "user_id" TEXT NOT NULL,
    "module_id" INTEGER NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completion_date" TIMESTAMP(3),
    "progress_id" INTEGER NOT NULL,

    CONSTRAINT "User_Module_Progress_pkey" PRIMARY KEY ("module_id","user_id")
);

-- CreateTable
CREATE TABLE "User_Lesson_Progress" (
    "user_id" TEXT NOT NULL,
    "lesson_id" INTEGER NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completion_date" TIMESTAMP(3),
    "progress_id" INTEGER NOT NULL,

    CONSTRAINT "User_Lesson_Progress_pkey" PRIMARY KEY ("lesson_id","user_id")
);

-- CreateTable
CREATE TABLE "User_Quiz_Progress" (
    "user_id" TEXT NOT NULL,
    "quizz_id" INTEGER NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completion_date" TIMESTAMP(3),
    "grade" INTEGER NOT NULL,
    "progress_id" INTEGER NOT NULL,

    CONSTRAINT "User_Quiz_Progress_pkey" PRIMARY KEY ("quizz_id","user_id")
);

-- CreateTable
CREATE TABLE "User_Project_Progress" (
    "user_id" TEXT NOT NULL,
    "project_id" INTEGER NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completion_date" TIMESTAMP(3),
    "grade" INTEGER NOT NULL,
    "progress_id" INTEGER NOT NULL,

    CONSTRAINT "User_Project_Progress_pkey" PRIMARY KEY ("project_id","user_id")
);

-- CreateTable
CREATE TABLE "User_Assignment_Progress" (
    "user_id" TEXT NOT NULL,
    "assignment_id" INTEGER NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completion_date" TIMESTAMP(3),
    "grade" INTEGER NOT NULL,
    "progress_id" INTEGER NOT NULL,

    CONSTRAINT "User_Assignment_Progress_pkey" PRIMARY KEY ("assignment_id","user_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Progress_progress_key" ON "Progress"("progress");

-- CreateIndex
CREATE UNIQUE INDEX "User_Roles_role_key" ON "User_Roles"("role");

-- CreateIndex
CREATE UNIQUE INDEX "Achivements_achivement_key" ON "Achivements"("achivement");

-- CreateIndex
CREATE UNIQUE INDEX "Course_Difficulties_difficulty_key" ON "Course_Difficulties"("difficulty");

-- CreateIndex
CREATE UNIQUE INDEX "Courses_Tags_tag_key" ON "Courses_Tags"("tag");

-- CreateIndex
CREATE UNIQUE INDEX "Course_Categories_category_key" ON "Course_Categories"("category");

-- CreateIndex
CREATE UNIQUE INDEX "User_Types_type_key" ON "User_Types"("type");

-- CreateIndex
CREATE UNIQUE INDEX "Courses_name_key" ON "Courses"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Courses_slug_key" ON "Courses"("slug");

-- AddForeignKey
ALTER TABLE "User_Achivements" ADD CONSTRAINT "User_Achivements_achievement_id_fkey" FOREIGN KEY ("achievement_id") REFERENCES "Achivements"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Achivements" ADD CONSTRAINT "User_Achivements_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Courses" ADD CONSTRAINT "Courses_creator_user_id_fkey" FOREIGN KEY ("creator_user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Courses" ADD CONSTRAINT "Courses_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Course_Categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Courses" ADD CONSTRAINT "Courses_difficulty_id_fkey" FOREIGN KEY ("difficulty_id") REFERENCES "Course_Difficulties"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Course_Enrollment" ADD CONSTRAINT "User_Course_Enrollment_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "Courses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Course_Enrollment" ADD CONSTRAINT "User_Course_Enrollment_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Course_Enrollment" ADD CONSTRAINT "User_Course_Enrollment_progress_id_fkey" FOREIGN KEY ("progress_id") REFERENCES "Progress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Course_Tags" ADD CONSTRAINT "Course_Tags_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "Courses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Course_Tags" ADD CONSTRAINT "Course_Tags_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "Courses_Tags"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Course_Modules" ADD CONSTRAINT "Course_Modules_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "Courses"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Assignments" ADD CONSTRAINT "Assignments_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "Course_Modules"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Projects" ADD CONSTRAINT "Projects_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "Course_Modules"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Quizzes" ADD CONSTRAINT "Quizzes_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "Course_Modules"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lessons" ADD CONSTRAINT "Lessons_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "Course_Modules"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Module_Progress" ADD CONSTRAINT "User_Module_Progress_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Module_Progress" ADD CONSTRAINT "User_Module_Progress_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "Course_Modules"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Module_Progress" ADD CONSTRAINT "User_Module_Progress_progress_id_fkey" FOREIGN KEY ("progress_id") REFERENCES "Progress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Lesson_Progress" ADD CONSTRAINT "User_Lesson_Progress_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Lesson_Progress" ADD CONSTRAINT "User_Lesson_Progress_lesson_id_fkey" FOREIGN KEY ("lesson_id") REFERENCES "Lessons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Lesson_Progress" ADD CONSTRAINT "User_Lesson_Progress_progress_id_fkey" FOREIGN KEY ("progress_id") REFERENCES "Progress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Quiz_Progress" ADD CONSTRAINT "User_Quiz_Progress_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Quiz_Progress" ADD CONSTRAINT "User_Quiz_Progress_quizz_id_fkey" FOREIGN KEY ("quizz_id") REFERENCES "Quizzes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Quiz_Progress" ADD CONSTRAINT "User_Quiz_Progress_progress_id_fkey" FOREIGN KEY ("progress_id") REFERENCES "Progress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Project_Progress" ADD CONSTRAINT "User_Project_Progress_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Project_Progress" ADD CONSTRAINT "User_Project_Progress_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "Projects"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Project_Progress" ADD CONSTRAINT "User_Project_Progress_progress_id_fkey" FOREIGN KEY ("progress_id") REFERENCES "Progress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Assignment_Progress" ADD CONSTRAINT "User_Assignment_Progress_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Assignment_Progress" ADD CONSTRAINT "User_Assignment_Progress_assignment_id_fkey" FOREIGN KEY ("assignment_id") REFERENCES "Assignments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Assignment_Progress" ADD CONSTRAINT "User_Assignment_Progress_progress_id_fkey" FOREIGN KEY ("progress_id") REFERENCES "Progress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "User_Types"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "User_Roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
