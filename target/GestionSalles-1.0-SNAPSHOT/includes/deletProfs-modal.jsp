<div id="modalDeleteProf" class="fixed inset-0 hidden bg-gray-900/50 flex items-center justify-center">
    <div class="bg-white p-6 rounded-lg shadow-lg w-1/3">
        <h2 class="text-lg font-semibold mb-4 text-center">Confirmer la suppression</h2>
        <p class="text-center text-gray-700">Voulez-vous vraiment supprimer ce professeur ?</p>

        <form id="deleteForm" method="POST" action="/GestionSalles/profs-servlet">
            <input type="hidden" name="action" value="supprimer">
            <input type="hidden" id="deleteID" name="id" value="">
            <div class="flex justify-center space-x-2 mt-4">
                <button type="button" onclick="closeModalDelete()" class="px-4 py-2 bg-gray-500 text-white rounded-md">
                    Annuler
                </button>
                <button type="submit" class="px-4 py-2 bg-red-600 text-white rounded-md">
                    Supprimer
                </button>
            </div>
        </form>
    </div>
</div>
<script defer>

    function openModalDelete(id) {
        document.getElementById('deleteID').value = id;
        document.getElementById('modalDeleteProf').classList.remove('hidden');
    }

    function closeModalDelete() {
        document.getElementById('modalDeleteProf').classList.add('hidden');
    }
</script>