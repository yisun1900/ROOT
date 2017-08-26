 <%@ page contentType="text/html;charset=GBK" %>
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #0000FF}
-->
</style>


  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折前</font></td>
      <td><input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折后</font></td>
      <td><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">综合折扣</font></td>
      <td><input name="zkl" type="text" id="zkl" value="<%=zkl%>" size="8" maxlength="8" readonly />
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">赠送净值</font></td>
      <td><input name="hdzsjz" type="text" value="<%=hdzsjz%>" size="20" maxlength="16" readonly /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><span class="STYLE1">代金券百分比</span></td>
      <td><input name="djjbfb" type="text" value="<%=djjbfb%>" size="10" maxlength="16" readonly="readonly">
      %</td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">赠送代金券</font></td>
      <td><input name="djjje" type="text" value="<%=djjje%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><span class="STYLE2">订金返现金额</span></td>
      <td><input name="djfxje" type="text" id="djfxje" value="<%=djfxje%>" size="20" maxlength="16" readonly="readonly" /></td>
      <td align="right"><font color="#FF0033">*</font><span class="STYLE2">直接减免金额</span></td>
      <td><div align="left">
        <input name="zjjmje" type="text" id="zjjmje" value="<%=zjjmje%>" size="20" maxlength="16" readonly="readonly" />
      </div></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>工程费减免额</td>
      <td><input name="cdzwjmje" type="text" onChange="calValue(insertform)" value="<%=cdzwjmje%>" size="20" maxlength="16"></td>
      <td align="right">&nbsp;</td>
      <td><input type="hidden" name="gcfqdzk" size="8" maxlength="8" value="<%=gcfqdzk%>" >	  
		<input type="hidden" name="glfzk" size="8" maxlength="8" value="<%=glfzk%>" >	  
		<input type="hidden" name="sjzk" size="8" maxlength="8" value="<%=sjzk%>" >	  
		<input type="hidden" name="sjfzk" size="8" maxlength="8" value="<%=sjfzk%>" >	  <input name="htjz" type="hidden" value="<%=htjz%>" size="20" maxlength="16" readonly />
        <input name="sgcbj" type="hidden" value="<%=sgcbj%>" size="20" maxlength="16" readonly />
        <input name="mle" type="hidden" value="<%=mle%>" size="20" maxlength="16" readonly />
        <input name="mll" type="hidden" value="<%=mll%>" size="8" maxlength="8" readonly />
        <input name="yjjz" type="hidden" value="<%=yjjz%>" size="20" maxlength="16" readonly />
        <input name="yjjzcs" type="hidden" value="<%=yjjzcs%>" size="8" maxlength="8" readonly />
        <input name="cbj" type="hidden" value="<%=cbj%>" size="20" maxlength="16" readonly />
        <input name="gcjcbj" type="hidden" value="<%=gcjcbj%>" size="20" maxlength="16" readonly /></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折前</font></td>
      <td><input name="zqgczjf" type="text" value="<%=zqgczjf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td><input name="zhgczjf" type="text" value="<%=zhgczjf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费百分比</font></td>
      <td><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="29%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折后</font></td>
      <td width="29%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金百分比</font></td>
      <td width="29%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td width="29%"><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">税金－折前</font></td>
      <td><input type="text" name="zqsuijin" value="<%=zqsuijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">税金－折后</font></td>
      <td><input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">记入业绩其它费－折前</font></td>
      <td><input name="zqqtsf" type="text" value="<%=zqqtsf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">记入业绩其它费－折后</font></td>
      <td><input name="zhqtsf" type="text" value="<%=zhqtsf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">记入业绩其它费项目</font></td>
      <td colspan="3"><input name="qtsfsm" type="text" value="<%=qtsfsm%>" size="73" maxlength="100" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">不记业绩其它费－折前</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">不记业绩其它费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">不记业绩其它费项目</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="73" maxlength="100" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">主材报价－折前</font></td>
      <td><input type="text" name="zqhtzcbj" value="<%=zqhtzcbj%>" size="20" maxlength="16" readonly="readonly"></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">主材报价－折后</font></td>
      <td><input type="text" name="zhhtzcbj" value="<%=zhhtzcbj%>" size="20" maxlength="16" readonly="readonly"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">设计费－折前</font></td>
      <td>
	  <input name="zqsjf" type="text" value="<%=zqsjf%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">设计费－折后</font></td>
      <td><input name="sjf" type="text" value="<%=sjf%>" size="20" maxlength="16" readonly></td>
    </tr>
  </TABLE>
