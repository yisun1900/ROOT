 <%@ page contentType="text/html;charset=GBK" %>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��ͬ�ܶ��ǰ</font></td>
      <td><input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��ͬ�ܶ�ۺ�</font></td>
      <td><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�ۺ��ۿ�</font></td>
      <td><input name="zkl" type="text" id="zkl" value="<%=zkl%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font>���;�ֵ</td>
      <td><input name="hdzsjz" type="text" value="<%=hdzsjz%>" size="20" maxlength="16" onchange="calValue(insertform)" /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����ȯ�ٷֱ�</td>
      <td><input name="djjbfb" type="text" value="<%=djjbfb%>" size="10" maxlength="16" readonly="readonly" />
%
  <input name="htjz" type="hidden" value="<%=htjz%>" size="20" maxlength="16" readonly />
  <input name="sgcbj" type="hidden" value="<%=sgcbj%>" size="20" maxlength="16" readonly />
  <input name="mle" type="hidden" value="<%=mle%>" size="20" maxlength="16" readonly />
  <input name="mll" type="hidden" value="<%=mll%>" size="8" maxlength="8" readonly />
  <input name="yjjz" type="hidden" value="<%=yjjz%>" size="20" maxlength="16" readonly />
  <input name="yjjzcs" type="hidden" value="<%=yjjzcs%>" size="8" maxlength="8" readonly />
  <input name="cbj" type="hidden" value="<%=cbj%>" size="20" maxlength="16" readonly />
  <input name="gcjcbj" type="hidden" value="<%=gcjcbj%>" size="20" maxlength="16" readonly /></td>
      <td align="right"><font color="#FF0033">*</font>���ʹ���ȯ</td>
      <td><input name="djjje" type="text" value="<%=djjje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    

    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ���ǰ</font></td>
      <td><input name="zqgczjf" type="text" value="<%=zqgczjf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>���̷�ǩ���ۿ�</td>
      <td><input name="gcfqdzk" type="text" value="<%=gcfqdzk%>" size="8" maxlength="8" onChange="calValue(insertform)" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ��ۺ�</font></td>
      <td><input name="zhgczjf" type="text" id="zhgczjf" value="<%=zhgczjf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>���̷Ѽ����</td>
      <td><input name="cdzwjmje" type="text" id="cdzwjmje"  onChange="calValue(insertform)" value="0" size="20" maxlength="16"></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ���ǰ</font></td>
      <td width="29%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>������ۿ�</td>
      <td width="29%"><input name="glfzk" type="text" value="<%=glfzk%>" size="8" maxlength="8" onChange="calValue(insertform)" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ��ۺ�</font></td>
      <td><input name="guanlif" type="text" id="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text" id="glfjmje"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����Ѱٷֱ�</font></td>
      <td width="29%"><input name="glfbfb" type="text" id="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��ٷֱ�</font></td>
      <td width="29%"><input name="suijinbfb" type="text" id="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">˰����ǰ</font></td>
      <td><input type="text" name="zqsuijin" value="<%=zqsuijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>˰���ۿ�</td>
      <td><input name="sjzk" type="text" id="sjzk" value="<%=sjzk%>" size="8" maxlength="8" onChange="calValue(insertform)" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">˰���ۺ�</font></td>
      <td><input name="suijin" type="text" id="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text" id="sjjmje"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">����ҵ�������ѣ���ǰ</font></td>
      <td><input name="zqqtsf" type="text" value="<%=zqqtsf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>����ҵ�������ѣ��ۺ�</td>
      <td><input name="zhqtsf" type="text" value="<%=zhqtsf%>" size="20" maxlength="16" onChange="calValue(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">����ҵ����������Ŀ</font></td>
      <td colspan="3"><input name="qtsfsm" type="text" value="<%=qtsfsm%>" size="73" maxlength="100" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">����ҵ�������ѣ���ǰ</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>����ҵ�������ѣ��ۺ�</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">����ҵ����������Ŀ</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="73" maxlength="100" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��Ʒѣ���ǰ</font></td>
      <td><input name="zqsjf" type="text" id="zqsjf" value="<%=zqsjf%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0033">*</font>��Ʒ��ۿ�</td>
      <td><input name="sjfzk" type="text" value="<%=sjfzk%>" size="8" maxlength="8" onChange="calValue(insertform)" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��Ʒѣ��ۺ�</font></td>
      <td><input name="sjf" type="text" id="sjf" value="<%=sjf%>" size="20" maxlength="16" readonly></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </TABLE>
