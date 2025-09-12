package jason.stdlib; 

import embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction;
import jason.asSemantics.DefaultInternalAction;
import jason.asSemantics.TransitionSystem;
import jason.asSemantics.Unifier;
import jason.asSyntax.ListTermImpl;
import jason.asSyntax.Term;
import static jason.asSyntax.ASSyntax.createAtom;

public class teste extends embedded.mas.bridges.jacamo.concurrentEmbeddedInternalAction {

// public class teste extends embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction {

        @Override
        public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
            ListTermImpl parameters = new ListTermImpl();
            for(Term t:args) parameters.add(t);
            Term[] arguments = new Term[3];
            arguments[0] =  createAtom("sample_roscore"); 
            arguments[1] =  createAtom( this.getClass().getSimpleName());
            arguments[2] = parameters;

            //System.out.println("starting to execute internal action");
            Object result = super.execute(ts, un,  arguments);            
            //System.out.println("finish to execute internal action");

            return result;
        }
}