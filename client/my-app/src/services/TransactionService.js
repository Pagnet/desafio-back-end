export async function getAllTransactions() {

    const response = await fetch('http://localhost:3000/transactions');
    return response.json();
}

export async function createTransaction(file) {
    const formData = new FormData();
    formData.append("transaction[file]", file);
    const response = await fetch(`http://localhost:3000/transactions/upload`, {
        method: 'POST',
        body: formData
    })
    return response;
}