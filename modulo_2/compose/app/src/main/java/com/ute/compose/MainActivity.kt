// MainActivity.kt
package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.ute.compose.ui.screens.*
import com.ute.compose.ui.material3.*

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // Componentes Basicos Nativos:
                // S01_SaludoScreen()
                // S02_TextScreen()
                //S03ButtonScreen()
                // S04LayoutScreen()
                //S05ModifierScreen()
                // S06EstadoScreen()
                // S07StateHoistingScreen()
                //S08BienvenidaScreen()

                // Componentes Material 3:
                //Paso01TextFieldScreen()
                // Paso01SumaScreen()
                // Paso01CompraScreen()
                // Paso02CardScreen()
                // Paso03LazyColumnScreen()
                // Paso04ScaffoldScreen()
                Paso05NavBarScreen()
                // Paso06_DialogosScreen()   // ← paso activo
            }
        }
    }
}