 <%@ page contentType="text/html;charset=GBK" %>
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE4 {color: #990000; font-weight: bold; }
-->
</style>


  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��ͬ�ܶ��ǰ</font></td>
      <td><input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��ͬ�ܶ�ۺ�</font></td>
      <td><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�ۺ��ۿ�</font></td>
      <td><input name="zkl" type="text" id="zkl" value="<%=zkl%>" size="8" maxlength="8" readonly />
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">���;�ֵ</font></td>
      <td><input name="hdzsjz" type="text" value="<%=hdzsjz%>" size="20" maxlength="16" readonly /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><span class="STYLE1">����ȯ�ٷֱ�</span></td>
      <td><input name="djjbfb" type="text" value="<%=djjbfb%>" size="10" maxlength="16" readonly="readonly">
      %</td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">���ʹ���ȯ</font></td>
      <td><input name="djjje" type="text" value="<%=djjje%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC"><input name="button" type="button" onclick="window.open('/dhzx/dhzx/ViewCrm_khzsxx.jsp?khbh=<%=khbh%>')" value="������Ϣ" />
      <input type="button" onclick="window.open('/khxx/ViewAllBj.jsp?khbh=<%=khbh%>')" value="������Ϣ" /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE4">��ͬ��ֵ</span></td>
      <td><input name="htjz" type="text" value="<%=htjz%>" size="20" maxlength="16" readonly /></td>
      <td align="right"><span class="STYLE4">ʩ���ɱ���</span></td>
      <td><input name="sgcbj" type="text" value="<%=sgcbj%>" size="20" maxlength="16" readonly /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">&nbsp;</td>
      <td colspan="3"><span class="STYLE4">��ͬ��ֵ���ۺ��ͬ�ܶ�(<%=qye%>)-���;�ֵ(<%=hdzsjz%>)-���ʹ���ȯ(<%=djjje%>)</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE4">ë����</span></td>
      <td colspan="3"><input name="mle" type="text" value="<%=mle%>" size="20" maxlength="16" readonly />      
        <span class="STYLE4">ë����</span>��<span class="STYLE4">��ͬ��ֵ(<%=htjz%>)</span>��<span class="STYLE4">ʩ���ɱ���(<%=sgcbj%>)</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE4">ë����</span></td>
      <td colspan="3"><input name="mll" type="text" value="<%=mll%>" size="8" maxlength="8" readonly />
      <span class="STYLE4">ë����</span>=<span class="STYLE4">��ë����</span>��<span class="STYLE4">��ͬ��ֵ����100������<%=mle%>��<%=htjz%>����100��</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE4">ҵ����ֵ����</span></td>
      <td><input name="yjjzcs" type="text" value="<%=yjjzcs%>" size="8" maxlength="8" readonly />
        %</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE4">ҵ����ֵ</span></td>
      <td colspan="3"><input name="yjjz" type="text" value="<%=yjjz%>" size="20" maxlength="16" readonly />
        <BR><span class="STYLE4">ҵ����ֵ=(���̷�ë����:<%=gcfmle%>+����ҵ��������ë����:<%=qtfmle%>-���;�ֵ:<%=hdzsjz%>-���ʹ���ȯ:<%=djjje%>)��ҵ����ֵ����</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE4">�ɱ���</span></td>
      <td><input name="cbj" type="text" value="<%=cbj%>" size="20" maxlength="16" readonly /></td>
      <td align="right"><span class="STYLE4">���̻�������</span></td>
      <td><input name="gcjcbj" type="text" value="<%=gcjcbj%>" size="20" maxlength="16" readonly /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE4">���̷��ۿ�</span></td>
      <td><input type="text" name="gcfqdzk" size="8" maxlength="8" value="<%=gcfqdzk%>" /></td>
      <td align="right"><span class="STYLE4">�������ۿ�</span></td>
      <td><input type="text" name="glfzk" size="8" maxlength="8" value="<%=glfzk%>" /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE4">˰���ۿ�</span></td>
      <td><input type="text" name="sjzk" size="8" maxlength="8" value="<%=sjzk%>" /></td>
      <td align="right"><span class="STYLE4">��Ʒ��ۿ�</span></td>
      <td><input type="text" name="sjfzk" size="8" maxlength="8" value="<%=sjfzk%>" /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>���̷Ѽ����</td>
      <td><input name="cdzwjmje" type="text" onChange="calValue(insertform)" value="<%=cdzwjmje%>" size="20" maxlength="16"></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ���ǰ</font></td>
      <td><input name="zqgczjf" type="text" value="<%=zqgczjf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ��ۺ�</font></td>
      <td><input name="zhgczjf" type="text" value="<%=zhgczjf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����Ѱٷֱ�</font></td>
      <td><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td align="right"><font color="#FF0033">*</font>�����Ѽ����</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">�����ѣ���ǰ</font></td>
      <td width="29%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">�����ѣ��ۺ�</font></td>
      <td width="29%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��ٷֱ�</font></td>
      <td width="29%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>˰������</td>
      <td width="29%"><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">˰����ǰ</font></td>
      <td><input type="text" name="zqsuijin" value="<%=zqsuijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">˰���ۺ�</font></td>
      <td><input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">����ҵ�������ѣ���ǰ</font></td>
      <td><input name="zqqtsf" type="text" value="<%=zqqtsf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">����ҵ�������ѣ��ۺ�</font></td>
      <td><input name="zhqtsf" type="text" value="<%=zhqtsf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">����ҵ����������Ŀ</font></td>
      <td colspan="3"><input name="qtsfsm" type="text" value="<%=qtsfsm%>" size="73" maxlength="100" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">����ҵ�������ѣ���ǰ</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">����ҵ�������ѣ��ۺ�</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">����ҵ����������Ŀ</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="73" maxlength="100" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��Ʒѣ���ǰ</font></td>
      <td>
	  <input name="zqsjf" type="text" value="<%=zqsjf%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��Ʒѣ��ۺ�</font></td>
      <td><input name="sjf" type="text" value="<%=sjf%>" size="20" maxlength="16" readonly></td>
    </tr>
  </TABLE>