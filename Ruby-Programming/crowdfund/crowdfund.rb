require_relative 'project'
require_relative 'fundrequest'

project1 = Project.new('LMN', 500, 3000)
project2 = Project.new('XYZ', 25, 75)

collection = FundRequest.new('VC-Friendly Start-up Projects')
collection.add_project(project1)
collection.add_project(project2)
collection.request_funding(3)
