<template>
  <div class="hello-world">
    <div class="container">
      <h1>{{ message }}</h1>
      <p>{{ description }}</p>
      <div class="info">
        <p><strong>Framework:</strong> Vue.js 3</p>
        <p><strong>Build Tool:</strong> Vite</p>
        <p><strong>Container:</strong> Docker</p>
      </div>
      <button @click="changeMessage" class="btn">Click Me!</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      message: 'Hello, World!',
      description: 'Welcome to your Vue.js application running in Docker',
      clicked: false
    }
  },
  methods: {
    changeMessage() {
      this.clicked = !this.clicked;
      this.message = this.clicked ? 'Hello, Docker!' : 'Hello, World!';
      this.description = this.clicked 
        ? 'This Vue.js app is containerized and ready for deployment!' 
        : 'Welcome to your Vue.js application running in Docker';
    }
  }
}
</script>

<style scoped>
.hello-world {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  padding: 20px;
}

.container {
  background: rgba(255, 255, 255, 0.95);
  padding: 40px;
  border-radius: 20px;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
  text-align: center;
  max-width: 500px;
  backdrop-filter: blur(10px);
}

h1 {
  color: #2c3e50;
  font-size: 3rem;
  margin-bottom: 20px;
  font-weight: 700;
}

p {
  color: #7f8c8d;
  font-size: 1.2rem;
  margin-bottom: 30px;
  line-height: 1.6;
}

.info {
  background: #f8f9fa;
  padding: 20px;
  border-radius: 10px;
  margin: 30px 0;
  border-left: 4px solid #667eea;
}

.info p {
  margin: 10px 0;
  color: #495057;
  font-size: 1rem;
}

.btn {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border: none;
  padding: 15px 30px;
  font-size: 1.1rem;
  border-radius: 50px;
  cursor: pointer;
  transition: all 0.3s ease;
  font-weight: 600;
  letter-spacing: 1px;
}

.btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
}

.btn:active {
  transform: translateY(0);
}
</style>
