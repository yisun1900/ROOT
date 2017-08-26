 <%@ page contentType="text/html;charset=GBK" %>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折前</font></td>
      <td><input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折后</font></td>
      <td><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">综合折扣</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" readonly>
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td><input name="htjz" type="hidden" value="<%=htjz%>" size="20" maxlength="16" readonly />
        <input name="sgcbj" type="hidden" value="<%=sgcbj%>" size="20" maxlength="16" readonly />
        <input name="mle" type="hidden" value="<%=mle%>" size="20" maxlength="16" readonly />
        <input name="mll" type="hidden" value="<%=mll%>" size="8" maxlength="8" readonly />
        <input name="yjjz" type="hidden" value="<%=yjjz%>" size="20" maxlength="16" readonly />
        <input name="yjjzcs" type="hidden" value="<%=yjjzcs%>" size="8" maxlength="8" readonly />
        <input name="cbj" type="hidden" value="<%=cbj%>" size="20" maxlength="16" readonly />
        <input name="gcjcbj" type="hidden" value="<%=gcjcbj%>" size="20" maxlength="16" readonly /></td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>赠送净值</td>
      <td><input name="hdzsjz" type="text" value="<%=hdzsjz%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>赠送代金券</td>
      <td><input name="djjje" type="text" value="<%=djjje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="29%"><input name="zqgczjf" type="text" value="<%=zqgczjf%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
      <td width="21%" align="right"><font color="#FF0033">*</font>工程费签单折扣</td>
      <td width="29%"><input type="text" name="gcfqdzk" size="8" maxlength="8" value="<%=gcfqdzk%>" onChange="calValue(insertform)" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td width="29%"><input name="zhgczjf" type="text" value="<%=zhgczjf%>" size="20" maxlength="16" readonly ></td>
      <td width="21%" align="right"><font color="#FF0033">*</font>工程费减免额</td>
      <td width="29%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="29%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>管理费折扣</td>
      <td width="29%"><input name="glfzk" type="text" onChange="calValue(insertform)" value="<%=glfzk%>" size="8" maxlength="8" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折后</font></td>
      <td><input name="guanlif" type="text" value="<%=guanlif%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="21%" align="right"><font color="#FF0033">*</font>管理费百分比</td>
      <td width="29%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" onChange="calValue(insertform)">
% </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td width="29%"><input name="suijinbfb" type="text" onChange="calValue(insertform)" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">折前税金</font></td>
      <td><input type="text" name="zqsuijin" value="<%=zqsuijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>税金折扣</td>
      <td><input name="sjzk" type="text" onChange="calValue(insertform)" value="<%=sjzk%>" size="8" maxlength="8" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">折后税金</font></td>
      <td><input name="suijin" type="text" value="<%=suijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>记入业绩其它费－折前</td>
      <td><input name="zqqtsf" type="text" value="<%=zqqtsf%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>记入业绩其它费－折后</td>
      <td><input name="zhqtsf" type="text" value="<%=zhqtsf%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">记入业绩其它费项目</td>
      <td colspan="3"><input name="qtsfsm" type="text" value="<%=qtsfsm%>" size="73" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>不记业绩其它费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>不记业绩其它费－折后</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">不记业绩其它费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="73" maxlength="100" ></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font>设计费－折前</td>
       <td><input name="zqsjf" type="text" id="zqsjf" value="<%=zqsjf%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
       <td align="right"><font color="#FF0033">*</font>设计费折扣</td>
       <td><input name="sjfzk" type="text" onChange="calValue(insertform)" value="<%=sjfzk%>" size="8" maxlength="8" >
         <b><font color="#0000FF">（>0且<=10）</font></b></td>
     </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font><font color="#0000FF">主材报价－折前</font></td>
       <td><input type="text" name="zqhtzcbj" value="<%=zqhtzcbj%>" size="20" maxlength="16" readonly="readonly" /></td>
       <td align="right"><font color="#FF0033">*</font><font color="#0000FF">主材报价－折后</font></td>
       <td><input type="text" name="zhhtzcbj" value="<%=zhhtzcbj%>" size="20" maxlength="16" readonly="readonly" /></td>
     </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font><font color="#0000FF">设计费－折前</font></td>
       <td><input name="zqsjf" type="text" value="<%=zqsjf%>" size="20" maxlength="16" readonly="readonly" /></td>
       <td align="right"><font color="#FF0033">*</font><font color="#0000FF">设计费－折后</font></td>
       <td><input name="sjf" type="text" value="<%=sjf%>" size="20" maxlength="16" readonly="readonly" /></td>
     </tr>
  </TABLE>
