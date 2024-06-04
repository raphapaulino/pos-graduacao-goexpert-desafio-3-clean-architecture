package graph

import (
	"github.com/raphapaulino/pos-graduacao-goexpert-desafio-3-clean-architecture/internal/usecase"
)

type Resolver struct {
	CreateOrderUseCase usecase.CreateOrderUseCase
	ListOrdersUseCase  usecase.ListOrdersUseCase
}
