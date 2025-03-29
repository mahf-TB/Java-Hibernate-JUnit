
<div id="modalProfUpdate" class=" fixed inset-0 hidden bg-gray-900/50  flex items-center justify-center">
    <div class="bg-white p-6 rounded-lg shadow-lg w-1/3">
        <h2 class="text-lg font-semibold mb-4 uppercase text-right">Modifier un Professeur</h2>
        <form  method="POST" action="/GestionSalles/profs-servlet">
            <input type="hidden" name="action" value="modifier">
            <input type="hidden" id="ID" name="id" value="">
            <div class="mb-4 flex items-start flex-col">
                <label class="text-sm font-medium text-gray-700">Code</label>
                <input type="text" id="updateCode" name="code" value="" class="w-full px-3 py-2 border rounded-md" required>
            </div>
            <div class="mb-4 flex items-start flex-col">
                <label class=" text-sm font-medium text-gray-700">Noms</label>
                <input type="text" id="updateNom" name="nom" value="" class="w-full px-3 py-2 border rounded-md" required>
            </div>
            <div class="mb-4 flex items-start flex-col">
                <label class=" text-sm font-medium text-gray-700">Prenom</label>
                <input type="text" id="updatePrenom" name="prenom" value="" class="w-full px-3 py-2 border rounded-md" required>
            </div>
            <div class="mb-4 flex items-start flex-col">
                <label class=" text-sm font-medium text-gray-700">Grade</label>
                <input type="text" id="updateGrade" name="grade" value="" class="w-full px-3 py-2 border rounded-md" required>
            </div>
            <div class="flex justify-end space-x-2">
                <button type="button" onclick="closeModalUp()" class="px-4 py-2 bg-gray-500 text-white rounded-md">Annuler</button>
                <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-md">Mettre à jour</button>
            </div>
        </form>
    </div>
</div>




<script defer>
    function openModalUp(id, code, nom, prenom, grade) {

        document.getElementById('ID').value = id;
        console.log("Code:", code, "Nom:", nom, "Prénom:", prenom, "Grade:", grade);

        const inputCode = document.getElementById('updateCode');
        const inputNom = document.getElementById('updateNom');
        const inputPrenom = document.getElementById('updatePrenom');
        const inputGrade = document.getElementById('updateGrade');

        if (!inputCode || !inputNom || !inputPrenom || !inputGrade) {
            console.error("Un ou plusieurs éléments input sont introuvables !");
            return;
        }

        inputCode.value = code;
        inputNom.value = nom;
        inputPrenom.value = prenom;
        inputGrade.value = grade;

        document.getElementById('modalProfUpdate').classList.remove('hidden');
    }

    function closeModalUp() {
        document.getElementById('modalProfUpdate').classList.add('hidden');
    }
</script>