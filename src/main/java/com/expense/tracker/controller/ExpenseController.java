package com.expense.tracker.controller;

import com.expense.tracker.dto.ExpenseRequest;
import com.expense.tracker.entity.Expense;
import com.expense.tracker.service.ExpenseService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/expenses")
@CrossOrigin(origins = "http://localhost:5173")
public class ExpenseController {
    
    private final ExpenseService expenseService;
    
    public ExpenseController(ExpenseService expenseService) {
        this.expenseService = expenseService;
    }
    
    @GetMapping
    public ResponseEntity<List<Expense>> getUserExpenses(Authentication authentication) {
        Long userId = (Long) authentication.getPrincipal();
        List<Expense> expenses = expenseService.getUserExpenses(userId);
        return ResponseEntity.ok(expenses);
    }
    
    @PostMapping
    public ResponseEntity<Expense> createExpense(@Valid @RequestBody ExpenseRequest request, 
                                                 Authentication authentication) {
        Long userId = (Long) authentication.getPrincipal();
        Expense expense = expenseService.createExpense(userId, request);
        return ResponseEntity.ok(expense);
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteExpense(@PathVariable Long id, 
                                          Authentication authentication) {
        Long userId = (Long) authentication.getPrincipal();
        expenseService.deleteExpense(id, userId);
        return ResponseEntity.ok("Expense deleted successfully");
    }
}
