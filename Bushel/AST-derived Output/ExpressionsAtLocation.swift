import Foundation

public extension Program {
    
    func expressions(at location: SourceLocation) -> [Expression] {
        ast.expressions(at: location)
    }
    
}

private extension Expression {
    
    func expressions(at location: SourceLocation) -> [Expression] {
        func collectSubexpressions() -> [Expression] {
            switch kind {
            case .empty:
                return []
            case .end:
                return []
            case .that:
                return []
            case .it:
                return []
            case .null:
                return []
            case let .sequence(expressions):
                return expressions
            case let .scoped(expression):
                return [expression]
            case let .parentheses(expression):
                return [expression]
            case let .function(name: _, parameters: _, arguments: _, body):
                return [body]
            case let .if_(condition, then, `else`):
                return `else`.map { [condition, then, $0] } ?? [condition, then]
            case let .repeatWhile(condition, repeating):
                return [condition, repeating]
            case let .repeatTimes(times, repeating):
                return [times, repeating]
            case let .repeatFor(_, container, repeating):
                return [container, repeating]
            case let .tell(target, to):
                return [target, to]
            case let .let_(_, initialValue):
                return initialValue.map { [$0] } ?? []
            case let .return_(expression):
                return expression.map { [$0] } ?? []
            case .use(resource: _):
                return []
            case .resource(_):
                return []
            case .integer(_):
                return []
            case .double(_):
                return []
            case .string(_):
                return []
            case let .list(expressions):
                return expressions
            case let .record(expressions):
                return expressions.flatMap { [$0.key, $0.value] }
            case let .prefixOperator(operation: _, operand):
                return [operand]
            case let .postfixOperator(operation: _, operand):
                return [operand]
            case let .infixOperator(operation: _, lhs, rhs):
                return [lhs, rhs]
            case .variable(_):
                return []
            case .enumerator(_):
                return []
            case .class_(_):
                return []
            case let .specifier(specifier):
                return specifier.allDataExpressionsFromSelfAndAncestors()
            case let .reference(to: expression):
                return [expression]
            case let .get(expression):
                return [expression]
            case let .set(expression, to: toExpression):
                return [expression, toExpression]
            case let .command(_, parameters: parameters):
                return parameters.map { $0.value }
            case .weave(_, _):
                return []
            case .endWeave:
                return []
            }
        }
        
        guard self.location.range.contains(location.range) else {
            return []
        }
        
        let subexpressions = collectSubexpressions()
        var containedSubexpressions: [Expression] = []
        for subexpression in subexpressions {
            containedSubexpressions.append(contentsOf: subexpression.expressions(at: location))
        }
        if !containedSubexpressions.isEmpty {
            return containedSubexpressions
        }
        
        // No children match but we match
        return [self]
    }
    
}
