package com.expense.tracker.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDate;

@Data
public class ExpenseRequest {
    @NotNull(message = "Amount is required")
    private BigDecimal amount;
    
    @NotBlank(message = "Category is required")
    private String category;
    
    private String subcategory;
    
    private String description;
    
    @NotNull(message = "Date is required")
    private LocalDate date;
}
