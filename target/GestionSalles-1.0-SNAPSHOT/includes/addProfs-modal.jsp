<div class="z-50">

    <button onclick="openModal()" class="inline-block text-[.925rem] uppercase font-medium leading-normal text-center align-middle cursor-pointer rounded-md transition-colors duration-150 ease-in-out text-light-inverse bg-gray-300 border-light shadow-none border-0 py-2 px-5 hover:bg-gray-200 active:bg-light focus:bg-light">
        Creer
    </button>

    <div id="modalProf" class="fixed inset-0 hidden bg-gray-900/50  flex items-center justify-center">

        <div class="mx-auto w-full max-w-lg bg-white p-6 rounded-lg shadow-lg">
            <h2 class="text-2xl font-medium text-center">Ajouter un Professeur</h2>

            <form  method="POST" action="/GestionSalles/profs-servlet" class="mt-6">
                <input type="hidden" name="action" value="ajouter">

                <div class="grid gap-6 ">
                    <div class="relative z-0">
                        <input type="text" id="createCode" name="code" class="peer block w-full border-0 border-b border-gray-500 bg-transparent py-2.5 px-0 text-sm text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                        <label id="code" class="absolute top-3 text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 origin-[0] peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:text-blue-600">Code</label>
                    </div>

                    <div class="relative z-0">
                        <input type="text" id="createNom" name="nom" class="peer block w-full border-0 border-b border-gray-500 bg-transparent py-2.5 px-0 text-sm text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                        <label id="nom"  class="absolute top-3 text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 origin-[0] peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:text-blue-600">Nom</label>
                    </div>

                    <div class="relative z-0">
                        <input type="text" id="createPrenom" name="prenom" class="peer block w-full border-0 border-b border-gray-500 bg-transparent py-2.5 px-0 text-sm text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                        <label id="prenom" class="absolute top-3 text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 origin-[0] peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:text-blue-600">Prénom</label>
                    </div>

                    <div class="relative z-0">
                        <input type="text" id="createGrade" name="grade" class="peer block w-full border-0 border-b border-gray-500 bg-transparent py-2.5 px-0 text-sm text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0" placeholder=" " required />
                        <label id="grade" class="absolute top-3 text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 origin-[0] peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:text-blue-600">Grade</label>
                    </div>
                </div>
                <div class="flex justify-end mt-6 space-x-2">
                    <button type="button" onclick="closeModal()" class="px-4 py-2 bg-gray-500 text-white rounded-md">Annuler</button>
                    <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-md">Ajouter</button>
                </div>

            </form>
        </div>
    </div>

</div>


<script defer>
    function openModal() {
        document.getElementById('modalProf').classList.remove('hidden');
    }

    function closeModal() {
        document.getElementById('modalProf').classList.add('hidden');
    }
</script>