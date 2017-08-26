 <%@ page contentType="text/html;charset=GBK" %>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#FF0033">*</font>合同总额－折前</td>
      <td><input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16"  >      </td>
      <td align="right"><font color="#FF0033">*</font>合同总额－折后</td>
      <td><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>综合折扣</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" >
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font>赠送净值</td>
      <td><input name="hdzsjz" type="text" value="<%=hdzsjz%>" size="20" maxlength="16" /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>代金券百分比</td>
      <td><input name="djjbfb" type="text" value="<%=djjbfb%>" size="10" maxlength="16" readonly="readonly" />
%</td>
      <td align="right"><font color="#FF0033">*</font>赠送代金券</td>
      <td><input name="djjje" type="text" value="<%=djjje%>" size="20" maxlength="16"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="29%"><input name="zqgczjf" type="text" value="<%=zqgczjf%>" size="20" maxlength="16"  ></td>
      <td width="21%" align="right"><font color="#FF0033">*</font>工程费签单折扣</td>
      <td width="29%"><input type="text" name="gcfqdzk" size="8" maxlength="8" value="<%=gcfqdzk%>"  >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>工程直接费－折后</td>
      <td width="29%"><input name="zhgczjf" type="text" value="<%=zhgczjf%>" size="20" maxlength="16" ></td>
      <td width="21%"><input name="htjz" type="hidden" value="<%=htjz%>" size="20" maxlength="16" />
      <input name="sgcbj" type="hidden" value="<%=sgcbj%>" size="20" maxlength="16" />
      <input name="mle" type="hidden" value="<%=mle%>" size="20" maxlength="16" />
      <input name="mll" type="hidden" value="<%=mll%>" size="8" maxlength="8" />
      <input name="yjjz" type="hidden" value="<%=yjjz%>" size="20" maxlength="16" />
      <input name="yjjzcs" type="hidden" value="<%=yjjzcs%>" size="8" maxlength="8" />
      <input name="cbj" type="hidden" value="<%=cbj%>" size="20" maxlength="16" />
      <input name="gcjcbj" type="hidden" value="<%=gcjcbj%>" size="20" maxlength="16" /></td>
      <td width="29%"><input type="hidden" name="cdzwjmje" value="0" size="20" maxlength="16" ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>管理费－折前</td>
      <td width="29%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16"  >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>管理费折扣</td>
      <td width="29%"><input name="glfzk" type="text" value="<%=glfzk%>" size="8" maxlength="8" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费－折后</td>
      <td><input name="guanlif" type="text" value="<%=guanlif%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>管理费百分比</td>
      <td><input name="glfjmje" type="hidden" value="0" size="20" maxlength="16" >
        <input name="glfbfb" type="text" value="<%=glfbfb%>" size="8" maxlength="16">
% </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>折前税金</td>
      <td><input type="text" name="zqsuijin" value="<%=zqsuijin%>" size="20" maxlength="16"  ></td>
      <td align="right"><font color="#FF0033">*</font>税金折扣</td>
      <td><input name="sjzk" type="text" value="<%=sjzk%>" size="8" maxlength="8" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>折后税金</td>
      <td><input name="suijin" type="text" value="<%=suijin%>" size="20" maxlength="16"  ></td>
      <td align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td><input name="sjjmje" type="hidden" value="0" size="20" maxlength="16" >
        <input name="suijinbfb" type="text" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>记入业绩其它费－折前</td>
      <td><input name="zqqtsf" type="text" value="<%=zqqtsf%>" size="20" maxlength="16"></td>
      <td align="right"><font color="#FF0033">*</font>记入业绩其它费－折后</td>
      <td><input name="zhqtsf" type="text" value="<%=zhqtsf%>" size="20" maxlength="16"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">记入业绩其它费项目</td>
      <td colspan="3"><input name="qtsfsm" type="text" value="<%=qtsfsm%>" size="73" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>不记业绩其它费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>不记业绩其它费－折后</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">不记业绩其它费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="73" maxlength="100" ></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font>设计费－折前</td>
       <td><input name="zqsjf" type="text" id="zqsjf" value="<%=zqsjf%>" size="20" maxlength="16" ></td>
       <td align="right"><font color="#FF0033">*</font>设计费折扣</td>
       <td><input name="sjfzk" type="text" value="<%=sjfzk%>" size="8" maxlength="8" >
         <b><font color="#0000FF">（>0且<=10）</font></b></td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>设计费－折后</td>
      <td><input name="sjf" type="text" value="<%=sjf%>" size="20" maxlength="16" ></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </TABLE>
