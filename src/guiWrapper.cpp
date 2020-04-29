#include "guiWrapper.h"

GuiWrapper::GuiWrapper(sp::P<sp::gui::Widget> gui)
: gui(gui)
{
}

GuiWrapper::~GuiWrapper()
{
    for(auto& it : wrappers)
        delete it.second;
    gui.destroy();
}

void GuiWrapper::onRegisterScriptBindings(sp::script::BindingClass& script_binding_class)
{
    script_binding_class.bind("getWidget", &GuiWrapper::getWidget);
    script_binding_class.bind("setOffset", &GuiWrapper::setOffset);
    script_binding_class.bind("setImage", &GuiWrapper::setImage);
    script_binding_class.bind("caption", &GuiWrapper::setCaption);
    script_binding_class.bind("value", &GuiWrapper::setValue);
    script_binding_class.bind("size", &GuiWrapper::setSize);
    script_binding_class.bind("show", &GuiWrapper::show);
    script_binding_class.bind("hide", &GuiWrapper::hide);
}

sp::P<GuiWrapper> GuiWrapper::getWidget(sp::string name)
{
    if (wrappers.find(name) != wrappers.end())
        return wrappers[name];

    sp::P<sp::gui::Widget> widget = gui->getWidgetWithID(name);
    if (!widget)
        return nullptr;
    wrappers[name] = new GuiWrapper(widget);
    return wrappers[name];
}

void GuiWrapper::setImage(sp::string name)
{
    gui->setAttribute("texture", name);
}

void GuiWrapper::setCaption(sp::string label)
{
    gui->setAttribute("caption", label);
}

void GuiWrapper::setValue(float value)
{
    gui->setAttribute("value", sp::string(value));
}

void GuiWrapper::setOffset(float x, float y)
{
    gui->layout.position.x = x;
    gui->layout.position.y = y;
}

void GuiWrapper::setSize(float x, float y)
{
    gui->layout.size.x = x;
    gui->layout.size.y = y;
}

void GuiWrapper::show()
{
    gui->show();
}

void GuiWrapper::hide()
{
    gui->hide();
}
