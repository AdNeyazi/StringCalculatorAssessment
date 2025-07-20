import React, { useState } from 'react';
import axios from 'axios';

const StringCalculator = () => {
  const [input, setInput] = useState('');
  const [result, setResult] = useState(null);
  const [error, setError] = useState('');

  const calculate = async () => {
    try {
      const response = await axios.post('http://localhost:4000/api/v1/calculate', { input });
      setResult(response.data.result);
      setError('');
    } catch (err) {
      console.error('Error occurred:', err);
      setResult(null);
      if (err.response?.data?.error) {
        setError(err.response.data.error);
      } else {
        setError('Something went wrong. Please try again.');
      }
    }
  };

  return (
    <div className="container mt-5">
      <div className="card shadow-lg">
        <div className="card-body">
          <h2 className="card-title text-center mb-4">🧮 String Calculator</h2>

          <div className="mb-3">
            <label className="form-label">Enter numbers:</label>
            <textarea
              className="form-control"
              rows="4"
              placeholder="e.g. 1,2\n3 or //;\n1;2"
              value={input}
              onChange={(e) => setInput(e.target.value)}
            />
          </div>

          <div className="d-grid">
            <button className="btn btn-primary" onClick={calculate}>
              Calculate
            </button>
          </div>

          {result !== null && (
            <div className="alert alert-success mt-3 text-center">
              ✅ Result: {result}
            </div>
          )}

          {error && (
            <div className="alert alert-danger mt-3 text-center">
              ❌ {error}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default StringCalculator;
