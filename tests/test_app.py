import unittest
import os
os.environ['Testing'] = 'true'

from app import app

class AppTestCase(unittest.TestCase):
    def setUp(self):
        self.client = app.test_client()

    def test_home(self):
        response = self.client.get("/")
        assert response.status_code == 200
        html = response.get_data(as_text = True)
        assert  "<title> project melodramatic monkeys </title>" in html

    def test_timeline(self):
        response = self.client.get("/api/timeline_post")
        assert response.status_code == 200
        assert response.is_json
        json = response.get_json()
        assert "timeline_posts" in json
        assert len(json["timeline_posts"]) == 0



    def test_malformed_timeline_post(self):
        response = self.client.post("/api/timeline_post", data = {"email": "john@example.com", "content": "Hello world, I'm John!"})
        assert response.status_code == 400
        html = response.get_data(as_text=True)
        assert "invalid name" in html

        response = self.client.post("api/timeline_post", data = {"name" : "John Doe", "email": "not-an-email", "content": ""})
        assert response.status_code == 400
        html = response.get_data(as_text=True)
        assert "Invalid email" in html     


    