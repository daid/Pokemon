#ifndef GUI_WRAPPER_H
#define GUI_WRAPPER_H

#include <sp2/script/bindingObject.h>
#include <sp2/graphics/gui/widget/widget.h>

class GuiWrapper : public sp::ScriptBindingObject
{
public:
    GuiWrapper(sp::P<sp::gui::Widget> gui);
    ~GuiWrapper();

    sp::P<GuiWrapper> getWidget(sp::string name);
protected:
    virtual void onRegisterScriptBindings(sp::ScriptBindingClass& script_binding_class) override;
    
    void setImage(sp::string name);

    void setCaption(sp::string label);

    void setValue(float value);

    void setOffset(float x, float y);
    
    void setSize(float x, float y);

    void show();

    void hide();

private:
    sp::P<sp::gui::Widget> gui;
    std::map<sp::string, GuiWrapper*> wrappers;
};

#endif//GUI_WRAPPER_H
